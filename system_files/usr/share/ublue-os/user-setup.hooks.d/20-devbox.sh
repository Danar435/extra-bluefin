#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh

version-script devbox user 1 || exit 1

if ! distrobox list | grep -q "my-custom-distrobox"; then
    distrobox create --name devbox --image quay.io/toolbx/arch-toolbox:latest --home "$HOME/.devbox"  --init
fi
