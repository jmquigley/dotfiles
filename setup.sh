#!/usr/bin/env bash

#
# Linking the startup environment
#

printf "Linking startup environment from '%s'\n" ${HOME}

while read LINE; do
    IFS=' '
    read -ra ARR <<< "$LINE"
    SRC="$(echo -e "./conf/${ARR[0]}" | tr -d '[:space:]')"
    DST="$(echo -e "${ARR[0]}${ARR[1]}" | tr -d '[:space:]')"

    [ -f ${SRC} ] && eval "ln -fvs ${SRC} ${DST}"
done < ${HOME}/conf/startup.list

if [ ! -d ${HOME}/bin ]; then
    ln -vs ./bin ${HOME}/bin
fi

if [ ! -d ${HOME}/.vim ]; then
    ln -vs ./vim ${HOME}/.vim
fi

printf "\n"
