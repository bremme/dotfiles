#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

function install_keepassxc() {
    local name="KeePassXC"
    log_info "Install '$name' (AppImage)"

    install_appimage "$name" https://github.com/keepassxreboot/keepassxc/releases/download/$KEEPASSXC_APPIMAGE_VERSION/KeePassXC-$KEEPASSXC_APPIMAGE_VERSION-x86_64.AppImage
    install_appimage_desktop_integration "$name"

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_keepassxc
fi