#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

function install_cura() {
    local name="Cura"
    log_info "Install '$name' (AppImage)"

    install_appimage "$name" https://github.com/Ultimaker/Cura/releases/download/$CURA_APPIMAGE_VERSION/Ultimaker_Cura-$CURA_APPIMAGE_VERSION.AppImage
    install_appimage_desktop_integration "$name"

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_cura
fi