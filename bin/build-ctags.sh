#!/usr/bin/env bash

#
# Builds a database of ctags from the current project repository
#
# http://ctags.sourceforge.net/ctags.html
#

if [ "${1}" == "" ]; then
	printf "Usage: build-ctags.sh {path}\n"
	exit 127
fi

DIR=`realpath ${1}`

if [ ! -d ${DIR} ]; then
    printf "Directory path '%s' doesn't exist, quitting\n" ${DIR}
	exit 127
fi

DIR_IGNORE='
-path *docs -o
-path *coverage -o
-path *build -o
-path *dist -o
-path ./research -o
-path ./sandbox
'

FILE_IGNORE='
-iname '*.d.ts'
'

FILE_INCLUDE='
-iname '*.ts' -o
-iname '*.tsx' -o
-iname '*.js' -o
-iname '*.jsx'
'

[ -f ~/.emacs.d/TAGS ] && rm ~/.emacs.d/TAGS

OUTFILE=/tmp/ctags.flist
find ${DIR} -type d \( ${DIR_IGNORE} \) -prune -o -type f \( ${FILE_IGNORE} \) -prune -o -type f \( ${FILE_INCLUDE} \) -print > ${OUTFILE}
ctags -o ~/.emacs.d/TAGS -a -e -L ${OUTFILE}
rm -f ${OUTFILE}
