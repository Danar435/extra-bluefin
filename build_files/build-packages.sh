#!/usr/bin/bash

set -eoux pipefail

# Install packages

dnf5 -y install gcc-c++ python3-devel
dnf5 -y install steam gamescope mangohud waydroid 

source /ctx/build_files/copr-helpers.sh
copr_install_isolated "faugus/faugus-launcher" faugus-launcher
copr_install_isolated "lizardbyte/beta" sunshine

# Setup packages

setcap 'cap_sys_admin+p' $(readlink -f /usr/bin/sunshine)
setcap 'CAP_SYS_NICE=eip'  $(readlink -f /usr/bin/gamescope)