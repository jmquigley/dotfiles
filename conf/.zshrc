# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"

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

# if command -v pyenv 1>/dev/null 2>&1; then
#     export VIRTUAL_ENV_DISABLE_PROMPT=1
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

[ -s "$NVM_HOME/nvm.sh" ] && \. "$NVM_HOME/nvm.sh"  # This loads nvm
[ -s "$NVM_HOME/bash_completion" ] && \. "$NVM_HOME/bash_completion"  # This loads nvm bash_completion

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

conda activate py3