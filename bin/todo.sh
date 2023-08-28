#!/usr/bin/env bash

#
# Searches the project for TODO tags within code.
#

PROJECT=${1:-thirteensystems}

pushd ${WORKSPACE}/${PROJECT}

DIR_IGNORE='
-path *node_modules -o
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
-iname 'README.md'
'

find `pwd` -type d \( ${DIR_IGNORE} \) -prune -o -type f \( ${FILE_IGNORE} \) -prune -o -type f \( ${FILE_INCLUDE} \) -exec grep -iH "TODO:" {} \;

popd
