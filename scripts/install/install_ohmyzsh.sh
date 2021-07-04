#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

function install_ohmyzsh() {
    local name="Oh My Zsh"
    if [ -d "$HOME/.oh-my-zsh" ]; then
        log_warning "'$name' already installed, skipping"
        return 0
    fi
    log_info "Install dependencies"
    sudo ap intstall curl zsh
    log_info "Install '$name' Type 'exit' after changing shell to continue"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log_info "Changing default shell to zsh for $USER"
    sudo chsh -s $(which zsh) "$USER"
    log_info "Logout or restart to start using '$name'"
    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_ohmyzsh
fi
