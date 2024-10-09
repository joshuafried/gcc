#!/bin/bash

set -e
set -x

mkdir build
cd build

../configure --enable-languages=c,c++ --prefix=$PWD/install/  --disable-multilib --disable-bootstrap LDFLAGS="-static"

make -j "$(nproc)"
make install-strip

cd install
tar -czf ../$(git rev-parse --abbrev-ref HEAD).tar.gz ./
