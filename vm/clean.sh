#!/bin/bash

cd /build/
if [ -e ./server ] ; then
    (cd ./server ; git clean -d -f -x)
fi
