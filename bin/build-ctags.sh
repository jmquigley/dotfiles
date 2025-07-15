#!/usr/bin/env bash

#
# Builds a database of ctags from the current project repository
#
#

make_ctags() {
    if [[ ! -f /usr/local/bin/ctags ]]; then
        pushd /tmp
        VERSION=6.1.0

        if [[ ! -d universal-ctags-${VERSION} ]]; then
            wget https://github.com/universal-ctags/ctags/releases/download/v${VERSION}/universal-ctags-${VERSION}.tar.gz
            tar -xzf universal-ctags-${VERSION}.tar.gz
        fi

        cd universal-ctags-${VERSION}
        ./configure --prefix=/usr/local
        make
        make install
        update-alternatives --install /usr/bin/ctags ctags /usr/local/bin/ctags 1

        popd
    fi
}

if [ "${1}" == "" ]; then
	printf "Usage: build-ctags.sh {path}\n"
	exit 127
fi

DIR=`realpath ${1}`

if [ ! -d ${DIR} ]; then
    printf "Directory path '%s' doesn't exist, quitting\n" ${DIR}
	exit 127
fi

make_ctags

pushd ${DIR}
DIRS=(`realpath ${DIR}` /usr/include)

if [ -f ~/.srcpath ]; then
    while read F; do
        echo "F=$F"
        DIRS+=($F)
    done < ~/.srcpath
fi

echo ${DIRS[*]}

DIR_IGNORE='
-path *.devcontainer -o
-path *.git -o
-path *.tox -o
-path *.vscode -o
-path ./docs -o
-path ./build -o
-path ./coverage -o
-path ./dist -o
-path ./research -o
-path ./sandbox
'

FILE_IGNORE='
-iname '*.d.ts'
'

FILE_INCLUDE='
-iname '*.cpp' -o
-iname '*.cxx' -o
-iname '*.c' -o
-iname '*.h' -o
-iname '*.hpp' -o
-iname '*.ts' -o
-iname '*.tsx' -o
-iname '*.js' -o
-iname '*.jsx'
'

OUTFILE=/tmp/ctags.flist
[ -f ${OUTFILE} ] && rm ${OUTFILE}
[ -f ~/.emacs.d/TAGS ] && rm ~/.emacs.d/TAGS

for directory in ${DIRS[*]}; do
    export CMD=`echo "find ${DIR} -type d \( ${DIR_IGNORE} \) -prune -o -type f \( ${FILE_IGNORE} \) -prune -o -type f \( ${FILE_INCLUDE} \) -print > ${OUTFILE}"`
    echo ${CMD}

    find ${directory} -type d \( ${DIR_IGNORE} \) -prune -o -type f \( ${FILE_IGNORE} \) -prune -o -type f \( ${FILE_INCLUDE} \) -print >> ${OUTFILE}
done

/usr/local/bin/ctags -o ~/.emacs.d/TAGS -a -e -L ${OUTFILE}

popd
