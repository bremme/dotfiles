#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_arduino() {
    local name="Arduino IDE"
    log_info "Install '$name' (snap)"

    if [[ -x $(which arduino) ]]; then
        log_error "Arduino is already installed at $(which arduino)"
        exit 1
    fi

    sudo snap install arduino
    log_info "Used $USER to dialout group"
    sudo usermod -a -G dialout $USER
    log_info "Linking $HOME/snap/arduino/current/Arduino to $HOME"
    ln -s $HOME/snap/arduino/current/Arduino $HOME
    log_info "Linking $HOME/snap/arduino/current/.arduino15 to $HOME"
    ln -s $HOME/snap/arduino/current/.arduino15 $HOME

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_arduino
fi