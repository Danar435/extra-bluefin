#!/usr/bin/bash

set -eoux pipefail

# Install packages

dnf5 -y install gcc-c++ steam gamescope mangohud waydroid 

source /ctx/build_files/copr-helpers.sh
copr_install_isolated "faugus/faugus-launcher" faugus-launcher
copr_install_isolated "lizardbyte/beta" sunshine

# Setup sunshine

setcap 'cap_sys_admin+p' $(readlink -f /usr/bin/sunshine)