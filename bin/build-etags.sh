#!/usr/bin/env bash

#
# Builds a database of etags from the current project repository
#

TAGFILE=`realpath ~/.emacs.d/TAGS`
echo "creating tags in ${TAGFILE}"

find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags --append --output=${TAGFILE}
