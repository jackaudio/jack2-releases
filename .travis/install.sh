#!/bin/bash

set -e

# Special macOS native handling
if [ "${TARGET}" = "macos" ] || [ "${TARGET}" = "macos-universal" ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 brew install cmake jq meson
    exit 0
fi

# Special handling for caching deb archives
if [ "$(ls ${HOME}/PawPawBuilds/debs | wc -l)" -ne 0 ]; then
    sudo cp ${HOME}/PawPawBuilds/debs/*.deb /var/cache/apt/archives/
fi

# common
sudo apt-get install -y autopoint build-essential curl cmake jq llvm mingw-w64 qttools5-dev-tools winehq-stable

# specific
if [ "${TARGET}" = "win32" ]; then
    sudo apt-get install -y binutils-mingw-w64-i686 g++-mingw-w64-i686
elif [ "${TARGET}" = "win64" ]; then
    sudo apt-get install -y binutils-mingw-w64-x86-64 g++-mingw-w64-x86-64
fi

# Special handling for caching deb archives
sudo mv /var/cache/apt/archives/*.deb ${HOME}/PawPawBuilds/debs/
