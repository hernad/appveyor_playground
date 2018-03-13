#!/bin/bash

echo "hello world"

#sudo apt install -y zip

echo "artifakt: $BUILD_ARTIFACT tag: $APPVEYOR_REPO_TAG_NAME pwd: $(pwd)"

gcc --version


curl -LO https://dl.bintray.com/hernad/harbour/hb-linux-i386.tar.gz
tar xvf hb-linux-i386.tar.gz

PATH=$(pwd)/hb-linux-i386/bin:$PATH

echo $PATH
ls -lh hb-linux-i386/bin

hbmk2 -version
hbmk2 -gtstd hello.prg
./hello
zip hello_${BUILD_ARTIFACT}_${APPVEYOR_REPO_TAG_NAME}.zip hello
