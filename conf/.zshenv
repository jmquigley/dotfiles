export WORKSPACE_ROOT=${WORKSPACE_ROOT:-/workspace}
export WORKSPACE=${WORKSPACE_ROOT}

export APPZ=/usr/local/apps
export ARCHFLAGS="-arch x86_64"
export CATALINA_HOME=/usr/local/share/tomcat
export COMPANY=${COMPANY:-ts}
export CONDA_HOME=/opt/conda
export BROWSER=
export PROJECT=${PROJECT:-mes}
export CONTEXT=${CONTEXT:-${COMPANY}/${PROJECT}}
export EDITOR=vim
export ENV=`uname`
export ENVIRONMENT=${ENVIRONMENT:-${WORKSPACE}/dotfiles}
export FORCE_COLOR=1
export GIT_EDITOR=vim
export HISTSIZE=5000
export JAVA_HOME=/usr/local/share/java
export LESS="-RXF"
export PROMPT_COMMAND='history -a'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export NODE_MODULES=`realpath ~/.node_modules`
export NODE_OPTIONS='--max-old-space-size=8192 --experimental-vm-modules'
export NVM_HOME=`realpath ~/.nvm`
export OPER=/usr/local/oper
export PAGER=most
export PNPM_HOME=`[ -e ~/.local/share/pnpm ] && realpath ~/.local/share/pnpm`
export PROJECT_ROOT=${WORKSPACE_ROOT}/${PROJECT}
export PYENV_ROOT=`realpath ~/.pyenv`
export PYTHONUNBUFFERED=1
export SVN_EDITOR=vim
export VISUAL=${EDITOR}
export WINDOWS=${WINDIR}/System32

[ -f ~/.custom ] && . ~/.custom
