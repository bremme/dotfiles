#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_pio() {
    local name="PlatformIO (VS Code extension)"
    if [[ ! -x $(which code) ]]; then
        log_error "Can't install PlatformIO VS Code is not installed"
    fi
    log_info "Install '$name'"
    log_info "Install distutils dependency"
    sudo apt install python3-distutils
    log_info "Install VS Code extension"
    for extension in "${PLATFORMIO_VSCODE_EXTENSIONS[@]}"
    do
        code \
            --user-data-dir ~/.config/Code_PlatformIO \
            --extensions-dir ~/.vscode-platformio/extensions \
            --install-extension "$extension"
    done

    log_info "Download and copy udev rules"
    curl \
        -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | \
        sudo tee /etc/udev/rules.d/99-platformio-udev.rules
    log_info "Restart udev service"
    sudo service udev restart
    log_info "Add '$USER' to dialout and plugdev group"
    sudo usermod -a -G dialout $USER
    sudo usermod -a -G plugdev $USER
    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_pio
fi
