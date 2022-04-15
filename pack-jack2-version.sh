#!/bin/bash

export JACK2_VERSION=1abd04edab2fef8e7b5e5197dd03034358a37078
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

# FIXME remove this on 1.9.22
ln -s ~/PawPawBuilds/builds/${target}/jack2-${JACK2_VERSION} PawPaw/jack2
ln -s ~/PawPawBuilds/builds/${target}/jack2-${JACK2_VERSION} ~/PawPawBuilds/builds/${target}/jack2-v1.9.21
export JACK2_VERSION=v1.9.21

./PawPaw/pack-jack2.sh ${target}

# ---------------------------------------------------------------------------------------------------------------------
