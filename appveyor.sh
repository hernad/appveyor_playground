#!/bin/bash

echo "hello world"

#sudo apt install -y zip

echo "artifakt: $BUILD_ARTIFACT tag: $APPVEYOR_REPO_TAG_NAME"

gcc --version

curl -LO https://dl.bintray.com/hernad/harbour/hb-linux-i386.tar.gz
tar xf hb-linux-i386.tar.gz
export PATH=$(pwd)/hb-linux-i386/bin:$PATH

hbmk2 -version
hbmk2 -gtstd hello.prg
./hello
zip hello_${BUILD_ARTIFACT}_${APPVEYOR_REPO_TAG_NAME}.zip hello
