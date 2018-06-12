#!/bin/bash

#yum install -y cmake gcc-c++ ncurses-devel git gnutls-devel bison systemd-devel rpm-build libaio-devel
# TODO - missing stuff
# zstd msgpack jemalloc

cd /build/server/
cmake . -DBUILD_CONFIG=mysql_release -DRPM=amzn2 -DWITH_WSREP:BOOL=OFF
make package
mv *.rpm ..
git clean -d -f -x



