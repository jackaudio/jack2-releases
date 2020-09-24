#!/bin/bash

set -e

if [ "${TARGET}" = "macos" ]; then
    exit 0
fi

if [ "${TARGET}" = "win32" ] || [ "${TARGET}" = "win64" ]; then
    wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
    sudo apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
    sudo dpkg --add-architecture i386
fi

sudo apt-get update -qq
sudo apt-get install -y libc6 libc6:i386 libc-dev-bin libc6-dev gcc-10-base:i386 libcrypt1:i386 libgcc-s1:i386
