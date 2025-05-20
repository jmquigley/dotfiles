#!/usr/bin/env bash

#
# Builds a database of etags from the current project repository
#

 find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags --append --output=`realpath ~/.emacs.d/TAGS`
