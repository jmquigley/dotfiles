#!/usr/bin/env bash

#
# Builds the valgrind memory checker from source.
#
# https://valgrind.org/downloads/current.html
#

VERSION=3.25.1
URL=https://sourceware.org/pub/valgrind/

if [[ ! -f /usr/local/bin/valgrind ]]; then
    pushd /tmp
    wget ${URL}valgrind-${VERSION}.tar.bz2
    tar -xjf valgrind-${VERSION}.tar.bz2

    pushd valgrind-${VERSION}

    ./configure
    make -j 10
    make install

    popd
    popd
fi
