#!/usr/bin/bash

#
# A dotfile configuration for all development environments.  This
# script is used to link the startup environment
#

printf "Linking startup environment from '%s'\n" ${HOME}

function usage() {
    echo "Usage: $0 [--no-less] [--no-cmake]"
    echo "  --no-less                Turn off the custom less build"
    echo "  --no-cmake               Turn off the custom cmake build"
    echo ""
    echo "Example: $0 --no-less --no-cmake"
    exit 1
}

# simple flags to turn off the custom less and cmake builds
NO_LESS=0
NO_CMAKE=0

# parse the command line arguments
while [[ "$#" > 0 ]]; do case $1 in
  --no-less) NO_LESS=1; shift;;
  --no-cmake) NO_CMAKE=1;shift;;
  *) usage "Unknown parameter passed: $1"; shift;;
esac; done

# Retrieve the powerlevel theme
if [[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

while read LINE; do
    IFS=' '
    read -ra ARR <<< "$LINE"
    SRC="$(echo -e "${PWD}/conf/${ARR[1]}" | tr -d '[:space:]')"
    DST="$(echo -e "${ARR[0]}${ARR[1]}" | tr -d '[:space:]')"

    [ -f ${SRC} ] && eval "ln -fvs ${SRC} ${DST}"
done < ./conf/startup.list

# link the powershell startup file
if [ ! -d ${HOME}/.config/powershell ]; then
    mkdir -p ${HOME}/.config/powershell
    ln -vs ${PWD}/conf/profile.ps1 ${HOME}/.config/powershell/profile.ps1
fi

if [ ! -d ${HOME}/bin ]; then
    ln -vs ${PWD}/bin ${HOME}/bin
    chmod -R 755 ${PWD}/bin
fi

if [ ! -d ${HOME}/.vim ]; then
    ln -vs ${PWD}/.vim ${HOME}/.vim
fi

# Install custom theme for zsh
if [ -d ~/.oh-my-zsh ]; then
    if [ -f ~/.oh-my-zsh/themes/agnoster.zsh-theme ]; then
        rm -f ~/.oh-my-zsh/themes/agnoster.zsh-theme
    fi

    ln -s ${PWD}/conf/agnoster.zsh-theme ${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme
fi

# Setup custom less command
if [ ${NO_LESS} -eq 0 ]; then
    ${PWD}/bin/build-less.sh
fi

# Setup custom cmake command
if [ ${NO_CMAKE} -eq 0 ]; then
    ${PWD}/bin/build-cmake.sh --binary
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# setup conda environment if it exists
if command -v conda &> /dev/null; then
    conda update conda -y

    if [[ ! -d /opt/conda/envs/py3 ]]; then
        conda env create -f ${PWD}/conf/conda-environment.yml
    fi
else
    echo "conda not found, so no installation of conda environment"
fi

printf "\n"
