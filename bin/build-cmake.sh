#!/usr/bin/bash

#
# This script builds CMake from source.  It's a long process
#

VERSION=3.30.3
NJOBS=10

pushd /tmp

if [[ ! -d cmake-${VERSION} ]]; then

         https://github.com/Kitware/CMake/releases/download/v3.30.3/cmake-3.30.3.tar.gz

    wget https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz
    tar -xzf cmake-${VERSION}.tar.gz
fi

cd cmake-${VERSION}

./bootstrap --prefix=/usr/local --parallel=${NJOBS} -- -DCMAKE_USE_OPENSSL=OFF
gmake --jobs=${NJOBS}
gmake install

popd
