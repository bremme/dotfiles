#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

NVM_VERSION="0.38.0"
export NVM_DIR="$HOME/.nvm"
declare -a DEPENDENCIES=(curl)

function install_node() {
    local name="node"
    if [ -d "$HOME/.nvm" ]; then
        log_error "'$name' already installed, skipping"
        exit 1
    fi
    log_info "Install dependencies for '$name'"
    sudo apt install ${DEPENDENCIES[*]}

    log_info "Install '$name'"

    log_info "Install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash

    log_info "Activate nvm"

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    log_info "Install latest node LTS version"
    nvm install --lts

    log_info "Finished installing '$name'"
}

function uninstall_node() {
    log_warning "Uninstalling node."
    if [ -d "$HOME/.nvm" ]; then
        rm -rf "$HOME/.nvm"
    fi
}

function upgrade_node() {
(
  cd "$NVM_DIR"
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_node
fi


