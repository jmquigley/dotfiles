# .bash_profile
umask 002
shopt -s histappend

export APPZ=/usr/local/apps
export ARCHFLAGS="-arch x86_64"
export CATALINA_HOME=/usr/local/share/tomcat
export COMPANY=thirteensystems
export CONDA_HOME=${HOME}/miniconda3
export PROJECT=${PROJECT:-mes}
export APP=${APP:-devops}
export CONTEXT=${CONTEXT:-${PROJECT}/${APP}}
export DATASTORE_EMULATOR_HOST=localhost:8081
export EDITOR=vim
export ENV=`uname`
export FORCE_COLOR=1
export GIT_EDITOR=vim
export HISTSIZE=5000
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

export WORKSPACE=${WORKSPACE:-~/workspace}
export DEVOPS=${DEVOPS:-~/workspace/devops}
export ENVIRONMENT=${ENVIRONMENT:-~/workspace/environment}
export YARN=~/.node_modules/bin/yarn

. ~/.bashrc

# System specific alias for OSX
if [[ ${OSTYPE} =~ "darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
	export CHROME_EXT="${HOME}/Library/Application Support/Google/Chrome/Default/Extensions"
	export RDT_ID="fmkadmapgofadopljbjfkapdkoienihi"
    export RDT_VER="2.5.2_0"
	export REACT_DEV_TOOL="${CHROME_EXT}/${RDT_ID}/${RDT_VER}"
    export COLOR=

    if command_exists vimpager; then
        export PAGER=`command -v vimpager`
    fi

    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    alias loadavg='sysctl -n vm.loadavg'
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    COLOR=''
else
    export JAVA_HOME="/usr/local/share/java"
	export CHROME_EXT=""
	export RDT_ID=""
    export RDT_VER="2.5.2_0"
	# export REACT_DEV_TOOL="${CHROME_EXT}/${RDT_ID}/${RDT_VER}"

    alias loadavg='cat /proc/loadavg'
    COLOR='--color=always'
fi

tabs -4