#!/usr/bin/env bash

#
# A dotfile configuration for all development environments.  This
# script is used to link the startup environment
#

printf "Linking startup environment from '%s'\n" ${HOME}

while read LINE; do
    IFS=' '
    read -ra ARR <<< "$LINE"
    SRC="$(echo -e "${PWD}/conf/${ARR[1]}" | tr -d '[:space:]')"
    DST="$(echo -e "${ARR[0]}${ARR[1]}" | tr -d '[:space:]')"

    [ -f ${SRC} ] && eval "ln -fvs ${SRC} ${DST}"
done < ./conf/startup.list

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
sh ${PWD}/conf/less.sh

# setup conda environment
. ~/.bashrc
conda env create -f ${PWD}/conf/conda-environment.yml

printf "\n"
