#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_freecad() {
    local name="FreeCAD"
    log_info "Install '$name' (AppImage)"

    install_appimage "$name" https://github.com/FreeCAD/FreeCAD/releases/download/0.18.4/FreeCAD_0.18-16146-rev1-Linux-Conda_Py3Qt5_glibc2.12-x86_64.AppImage

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_freecad
fi