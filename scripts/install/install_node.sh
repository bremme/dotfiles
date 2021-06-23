#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_node() {
    local name="node"
    if [ -d "$HOME/.node" ]; then
        log_error "'$name' already installed, skipping"
        exit 1
    fi
    log_info "Install '$name'"

    log_info "Install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    log_info "Activate nvm"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    log_info "Install latest node LTS version"
    nvm install --lts

    log_info "Finished installing '$name'"
}

function uninstall_node() {
    log_warning "Uninstalling node."
    if [ -d "$HOME/.node" ]; then
        rm -rf "$HOME/.node"
    fi
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_node
fi


