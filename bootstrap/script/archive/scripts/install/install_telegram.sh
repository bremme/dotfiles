#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

function install_telegram() {
    local name="Telegram"
    log_info "Install '$name' (binairy)"

    if [[ -d "$APPS_FOLDER/Telegram" ]]; then
        log_error "$APPS_FOLDER/Telegram alraedy exists"
        exit 1
    fi

    mkdir -p "$APPS_FOLDER"

    wget --output-document /tmp/tsetup.tar.xz https://github.com/telegramdesktop/tdesktop/releases/download/v$TELEGRAM_VERSION/tsetup.$TELEGRAM_VERSION.tar.xz
    tar xvf /tmp/tsetup.tar.xz
    mv /tmp/Telegram "$APPS_FOLDER"

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_telegram
fi