#!/usr/bin/env bash
source $(dirname "$0")/../utils.sh

PLUGINS_FOLDER="/usr/lib/keepass2/Plugins"
KEECLOUD_VERSION="1.2.1.11"

function install_keepass() {
    local name="KeePass 2.x"
    log_info "Install '$name' (deb)"

    sudo apt install keepass2 keepass2-doc

    log_info "Adding $name shortcuts"
    $(dirname "$0")/../gsettings/shortcuts.gsettings.sh "keepass2"

    if [ $(confirm "Do you want to install $name plugins?") = true ]; then
        sudo mkdir -p "$PLUGINS_FOLDER"
        log_info "Install 'mono-complete'"
        sudo apt install mono-complete
        if [ $(confirm "Do you want to install the KeeCloud plugin?") = true ]; then
            sudo apt install xdotool
            sudo wget -P "$PLUGINS_FOLDER" https://web.archive.org/web/20200623051047/https://bitbucket.org/devinmartin/keecloud/downloads/KeeCloud.$KEECLOUD_VERSION.plgx
            log_info "Adding global auto type shortcut <CTRL>+<ALT>+<SPACE>"

        fi
    fi

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_keepass
fi