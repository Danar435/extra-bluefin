#!/usr/bin/bash

set -eoux pipefail

# Build Extensions

glib-compile-schemas --strict /usr/share/gnome-shell/extensions/copyous@boerdereinar.dev/resources/schemas
glib-compile-schemas --strict /usr/share/gnome-shell/extensions/color-picker@tuberry/res/schema
glib-compile-schemas --strict /usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/src/schemas
glib-compile-schemas --strict /usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst/extension/schemas
