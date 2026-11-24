#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

TERMINAL_FONT="FiraCode Nerd Font Mono Medium"
TERMINAL_FONT_SIZE="11"
declare -a DEPENDENCIES=(curl unzip)

function install_starship() {
    local name="Starship"
    if [ -f /usr/local/bin/starship ]; then
        log_warning "'$name' already installed, skipping"
    else
        log_info "Install dependencies for '$name'"
        sudo apt install ${DEPENDENCIES[*]}
        log_info "Install '$name'"
        curl -sS https://starship.rs/install.sh | sh
    fi


    # If starship not found add init line
    if ! "$(grep "startship" ~/.zshrc)"; then
        log_info "Add 'starship init to .zshrc'"
        echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    fi

    # install Nerd font(s)
    log_info "Download and install Nerd font"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip -O /tmp/FiraCode.zip
    unzip -o /tmp/FiraCode.zip -d ~/.local/share/fonts
    sudo fc-cache -f -v
    # Set font on terminal
    log_info "Set Terminal Nerd font"
    DEFAULT_UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
    DEFAULT_SCHEMA="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_UUID/"
    gsettings set $DEFAULT_SCHEMA use-system-font "false"
    gsettings set $DEFAULT_SCHEMA font "$TERMINAL_FONT $TERMINAL_FONT_SIZE"

    log_info "Finished installing '$name'"
}

function uninstall_starship() {
    sh -c 'rm "$(which starship)"'
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_starship
fi
