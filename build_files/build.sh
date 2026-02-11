#!/bin/bash

set -eoux pipefail

# Enable nullglob for all glob operations to prevent failures on empty matches

shopt -s nullglob

# Copy system files

cp -r /ctx/system_files/* /

# Install packages

dnf5 -y install gcc-c++ wayland-utils
dnf5 -y install steam gamescope mangohud waydroid 

source /ctx/build_files/copr-helpers.sh
copr_install_isolated "faugus/faugus-launcher" faugus-launcher
copr_install_isolated "lizardbyte/beta" sunshine

# Setup sunshine

setcap 'cap_sys_admin+p' $(readlink -f /usr/bin/sunshine)

# Restore default glob behavior

shopt -u nullglob