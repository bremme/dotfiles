#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_signal() {
    local name="Signal"
    log_info "Install '$name'"

    # NOTE: These instructions only work for 64 bit Debian-based
    # Linux distributions such as Ubuntu, Mint etc.

    # 1. Install our official public software signing key
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

    # 2. Add our repository to your list of repositories
    echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

    # 3. Update your package database and install signal
    sudo apt update && sudo apt install signal-desktop indicator-application

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_signal
fi

