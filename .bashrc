# Source global definitions
if [ -f /etc/bashrc ]; then
  [ -f /etc/bashrc ] && . /etc/bashrc
fi

DIR=Ex
SYM_LINK=Gx
SOCKET=Fx
PIPE=dx
EXE=Cx
BLOCK_SP=Dx
CHAR_SP=Dx
EXE_SUID=hb
EXE_GUID=ad
DIR_STICKY=Ex
DIR_WO_STICKY=Ex

[ -f ~/.path ] && . ~/.path

# User specific aliases and functions
export PS1='\t \[\e[30;43m\]['${APP}']\[\e[m\] \[\e[34;47m\]\u\[\e[m\]@\[\e[37;41m\]\h\[\e[m\]: \[\e[0;36m\]\w\[\e[0m\]
~>'

[ -f ~/.virtualenv ] && . ~/.virtualenv
[ -f ~/.env ] && . ~/.env
[ -f ~/.functions ] && . ~/.functions

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/share/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_HOME}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_HOME}/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_HOME}/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pnpm
 export PNPM_HOME="/root/.local/share/pnpm"
 case ":$PATH:" in
   *":$PNPM_HOME:"*) ;;
   *) export PATH="$PNPM_HOME:$PATH" ;;
 esac
 # pnpm end
 