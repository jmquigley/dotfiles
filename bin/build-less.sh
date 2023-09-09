#!/usr/bin/bash

VERSION=643

pushd /tmp

if [[ ! -d less-${VERSION} ]]; then
    wget http://www.greenwoodsoftware.com/less/less-${VERSION}.tar.gz
    tar -xzf less-${VERSION}.tar.gz
fi

cd less-${VERSION}
./configure --prefix=/usr/local
make
make install

popd