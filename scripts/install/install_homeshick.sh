#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

declare -a DEPENDENCIES=(git)

function install_homeshick() {
    local name="homesick"
    if [ -d "$HOME/.homesick" ]; then
        log_warning "'$name' already installed, skipping"
    else
        log_info "Install dependencies for '$name'"
        sudo apt install ${DEPENDENCIES[*]}

        log_info "Install '$name'"

        git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    fi

    source "$HOME/.homesick/repos/homeshick/homeshick.sh"

    log_info "Cloning custom castles"
    for repo in "${HOMESHICK_CASTLES[@]}"
    do
        if [ $(confirm "Do you want to clone homeshick castle '$repo'?") = true ]; then
            homeshick clone "$repo"
        fi
    done
    # link all castles
    log_warning "Link castles"
    homeshick link -f -b
    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_homeshick
fi