#!/bin/bash

echo "hello world"

apt install -y zip

zip hello_${BUILD_ARTIFACT}_${APPVEYOR_REPO_TAG_NAME}.zip hello.prg
