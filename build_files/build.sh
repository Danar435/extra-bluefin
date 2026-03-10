#!/bin/bash

set -eoux pipefail

# Enable nullglob for all glob operations to prevent failures on empty matches

shopt -s nullglob

# Copy system files

cp -r /ctx/system_files/* /

# Run build scripts

#/ctx/build_files/build-extensions.sh
/ctx/build_files/build-packages.sh
/ctx/build_files/build-fingerprint.sh

# Restore default glob behavior

shopt -u nullglob