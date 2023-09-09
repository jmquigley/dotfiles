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

[ -s "$NVM_HOME/nvm.sh" ] && \. "$NVM_HOME/nvm.sh"  # This loads nvm
[ -s "$NVM_HOME/bash_completion" ] && \. "$NVM_HOME/bash_completion"  # This loads nvm bash_completion

if [ -d "/opt/conda" ]; then
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
fi