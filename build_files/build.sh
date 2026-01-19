#!/bin/bash

set -ouex pipefail

### Enable repositories

dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y copr enable faugus/faugus-launcher
dnf5 -y copr enable lizardbyte/beta

### Install packages

dnf5 -y install steam gamescope gamemode mangohud faugus-launcher waydroid sunshine

### Cleaning up

dnf5 -y remove rpmfusion-free-release
dnf5 -y remove rpmfusion-nonfree-release
dnf5 -y copr disable faugus/faugus-launcher
dnf5 -y copr disable lizardbyte/beta

### Install vscode

#tee /etc/yum.repos.d/vscode.repo <<'EOF'
#[code]
#name=Visual Studio Code
#baseurl=https://packages.microsoft.com/yumrepos/vscode
#enabled=1
#gpgcheck=1
#gpgkey=https://packages.microsoft.com/keys/microsoft.asc
#EOF
#sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/vscode.repo
#dnf5 -y install --enablerepo=code code

### Setup sunshine

setcap 'cap_sys_admin+p' $(readlink -f /usr/bin/sunshine)

### Setup aliases

echo '# Setup system wide aliases
play()     { gamemoderun gamescope -W 1920 -H 1080 -f -- mangohud "$@"; }
play-fsr() { gamemoderun gamescope -W 1920 -H 1080 -f -F fsr -- mangohud "$@"; }
play-int() { gamemoderun gamescope -W 1920 -H 1080 -f -F nearest -S integer -- mangohud "$@"; }
' >> /etc/profile.d/aliases.sh
