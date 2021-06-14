#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_syncthing() {
    local name="Syncthing"
    log_info "Install '$name'"
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    sudo apt update
    sudo apt install syncthing

    # copy script for autostarting
    log_info "Copy autostart script: cp /usr/share/applications/syncthing-start.desktop $HOME/.config/autostart"
    mkdir -p $HOME/.config/autostart
    cp /usr/share/applications/syncthing-start.desktop "$HOME/.config/autostart/"

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_syncthing
fi

