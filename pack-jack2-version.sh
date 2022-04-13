#!/bin/bash

export JACK2_VERSION=84d80c0a8c4f62839995ff96ad2b00d3ffed6211
export QJACKCTL_VERSION=0.9.7

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
rm -rf ~/PawPawBuilds/builds/*/qjackctl-${QJACKCTL_VERSION}

# ---------------------------------------------------------------------------------------------------------------------

./PawPaw/build-jack2.sh ${target}
./PawPaw/pack-jack2.sh ${target}

# ---------------------------------------------------------------------------------------------------------------------
