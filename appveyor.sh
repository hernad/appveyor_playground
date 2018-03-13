#!/bin/bash

echo "hello world"

#sudo apt install -y zip

echo "artifakt: $BUILD_ARTIFACT tag: $APPVEYOR_REPO_TAG_NAME pwd: $(pwd)"

gcc --version

# https://redmine.bring.out.ba/issues/35387

dpkg --add-architecture i386
curl -LO https://dl.bintray.com/hernad/harbour/hb-linux-i386.tar.gz
tar xvf hb-linux-i386.tar.gz

export HB_PLATFORM=linux
export HB_ROOT=$(pwd)/hb-linux-i386
export HB_USER_CFLAGS=-m32
export HB_USER_DFLAGS='-m32 -L/usr/lib32'
export HB_USER_LDFLAGS='-m32 -L/usr/lib32'

sudo apt install -y g++-multilib gcc-multilib lib32stdc++6  lib32readline5 libpq-dev:i386

PATH=$HB_ROOT/bin:$PATH

echo $PATH
ls -lh hb-linux-i386/bin

hbmk2 -version
hbmk2 -gtstd hello.prg
./hello
zip hello_${BUILD_ARTIFACT}_${APPVEYOR_REPO_TAG_NAME}.zip hello
