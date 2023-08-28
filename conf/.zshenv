export APPZ=/usr/local/apps
export ARCHFLAGS="-arch x86_64"
export CATALINA_HOME=/usr/local/share/tomcat
export COMPANY=deltarfasteners
export PROJECT=${PROJECT:-mes}
export APP=${APP:-devops}
export CONTEXT=${CONTEXT:-${PROJECT}/${APP}}
export DATASTORE_EMULATOR_HOST=localhost:8081
export EDITOR=vim
export ENV=`uname`
export FORCE_COLOR=1
export GIT_EDITOR=vim
export HISTSIZE=5000
export JAVA_HOME=/usr/local/share/java
export LESS="-RXF"
export PROMPT_COMMAND='history -a'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export NODE_MODULES=`realpath ~/.node_modules`
export NODE_OPTIONS=--max-old-space-size=8192
export OPER=/usr/local/oper
export PYENV_ROOT=`realpath ~/.pyenv`
export PYTHONUNBUFFERED=1
export SVN_EDITOR=vim
export VISUAL=${EDITOR}
export WINDOWS=${WINDIR}/System32
export YARN_GLOBAL=`realpath ~/.config/yarn/global`

export WORKSPACE=${WORKSPACE:-~/workspace}
export DEVOPS=${DEVOPS:-~/workspace/devops}
export ENVIRONMENT=${ENVIRONMENT:-~/workspace/environment}
export YARN=~/.node_modules/bin/yarn

export BROWSER="${ENVIRONMENT}/bin/firefox.sh"
export GOOGLE_SDK=~/workspace/apps/google-cloud-sdk
