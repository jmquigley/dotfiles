typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
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

[ -s "$NVM_HOME/nvm.sh" ] && \. "$NVM_HOME/nvm.sh"  # This loads nvm
[ -s "$NVM_HOME/bash_completion" ] && \. "$NVM_HOME/bash_completion"  # This loads nvm bash_completion

conda_setup py3

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME=`[ -e ~/.local/share/pnpm ] && realpath ~/.local/share/pnpm`
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
