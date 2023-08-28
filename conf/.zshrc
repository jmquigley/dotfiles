# Path to your oh-my-zsh installation.
export ZSH="/home/jmquigley/.oh-my-zsh"

ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

unalias ll

[ -f ~/.custom ] && . ~/.custom

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
[ -f ~/.virtualenv ] && . ~/.virtualenv
[ -f ~/.env ] && . ~/.env
[ -f ~/.functions ] && . ~/.functions

if command -v pyenv 1>/dev/null 2>&1; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -f "${GOOGLE_SDK}/path.zsh.inc" ]; then source "${GOOGLE_SDK}/path.zsh.inc"; fi
if [ -f "${GOOGLE_SDK}/completion.zsh.inc" ]; then source "${GOOGLE_SDK}/completion.zsh.inc"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jmquigley/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jmquigley/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jmquigley/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jmquigley/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
