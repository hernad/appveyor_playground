#!/bin/bash

echo "hello world"

apt install -y zip

zip hello_${APPVEYOR_REPO_TAG_NAME}.zip hello.prg
