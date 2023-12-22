# .bash_profile
umask 002
shopt -s histappend

export WORKSPACE_ROOT=${WORKSPACE_ROOT:-/workspace}
export WORKSPACE=${WORKSPACE_ROOT}

export APPZ=/usr/local/apps
export ARCHFLAGS="-arch x86_64"
export BROWSER=
export CATALINA_HOME=/usr/local/share/tomcat
export COMPANY=${COMPANY:-ts}
export CONDA_HOME=/opt/conda
export PROJECT=${PROJECT:-mes}
export CONTEXT=${CONTEXT:-${COMPANY}/${PROJECT}}
export EDITOR=vim
export ENV=`uname`
export ENVIRONMENT=${ENVIRONMENT:-${WORKSPACE}/dotfiles}
export FORCE_COLOR=1
export GIT_EDITOR=vim
export HISTSIZE=5000
export JAVA_HOME=/usr/local/share/java
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export NODE_MODULES=`realpath ~/.node_modules`
export NODE_OPTIONS='--max-old-space-size=8192 --experimental-vm-modules'
export OPER=/usr/local/oper
export PAGER=most
export PROMPT_COMMAND='history -a'
export PNPM_HOME=`realpath ~/.local/share/pnpm`
export PYENV_ROOT=`realpath ~/.pyenv`
export PYTHONUNBUFFERED=1
export SVN_EDITOR=vim
export VISUAL=${EDITOR}
export WINDOWS=${WINDIR}/System32

. ~/.bashrc

# System specific alias for OSX
if [[ ${OSTYPE} =~ "darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
	export CHROME_EXT="${HOME}/Library/Application Support/Google/Chrome/Default/Extensions"
	export RDT_ID="fmkadmapgofadopljbjfkapdkoienihi"
    export RDT_VER="2.5.2_0"
	export REACT_DEV_TOOL="${CHROME_EXT}/${RDT_ID}/${RDT_VER}"
    export COLOR=

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
