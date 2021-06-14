#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_essentials() {
    local name="Essentials"
    log_info "Install '$name'"
    log_info "Going to install: ${ESSENTIAL_PACKAGES[*]}"
    sudo apt install -y ${ESSENTIAL_PACKAGES[*]}
    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_essentials
fi