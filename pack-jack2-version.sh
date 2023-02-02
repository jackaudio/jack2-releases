#!/bin/bash

export JACK2_VERSION=v1.9.22
export JACK_EXAMPLE_TOOLS_VERSION=0c4a3df94f4f87048e101f4c5ee282ed7a1080b3
export QJACKCTL_VERSION=0.9.9

set -e

cd $(dirname ${0})

# ---------------------------------------------------------------------------------------------------------------------

target="${1}"

if [ -z "${target}" ]; then
    echo "usage: ${0} <target>"
    exit 1
fi

# ---------------------------------------------------------------------------------------------------------------------
# clean builds

rm -rf ~/PawPawBuilds/builds/*/jack-router-*
rm -rf ~/PawPawBuilds/builds/*/jack2-${JACK2_VERSION}
rm -rf ~/PawPawBuilds/builds/*/jack-example-tools-${JACK_EXAMPLE_TOOLS_VERSION}
rm -rf ~/PawPawBuilds/builds/*/qjackctl-${QJACKCTL_VERSION}

# ---------------------------------------------------------------------------------------------------------------------

./PawPaw/build-jack2.sh ${target}
./PawPaw/pack-jack2.sh ${target}

# ---------------------------------------------------------------------------------------------------------------------
