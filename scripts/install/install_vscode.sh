#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_vscode() {
    local name="Visual Studio Code"
    log_info "Install '$name' (deb)"

    wget https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-x64 -O "/tmp/code.deb"
    sudo apt install /tmp/code.deb

    if [ $(confirm "Do you want to install VS Code extensions '$VSCODE_EXTENSIONS'?") = true ]; then
        for extension in "${VSCODE_EXTENSIONS[@]}"
        do
            code --install-extension "$extension"
        done
    fi

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_vscode
fi