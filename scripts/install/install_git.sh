#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_git() {
    if [ ! -x $(which git) ]; then
        log_info "Install git"
        sudo apt install -y git
    fi
    log_info "Set git username ($GIT_USER_NAME) and email ($GIT_EMAIL)"
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_EMAIL"
    log_info "Finished installing git"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_git
fi
