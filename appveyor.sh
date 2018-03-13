#!/bin/bash

echo "hello world"

#sudo apt install -y zip

echo "artifakt: $BUILD_ARTIFACT tag: $APPVEYOR_REPO_TAG_NAME"

gcc --version

zip hello_${BUILD_ARTIFACT}_${APPVEYOR_REPO_TAG_NAME}.zip hello.prg
