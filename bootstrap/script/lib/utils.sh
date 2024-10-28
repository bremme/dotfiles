#!/usr/bin/env bash

DEBUG=true

# colors
BLACK="\033[0;30m"
DARK_GRAY="\033[1;30m"
RED="\033[0;31m"
LIGHT_RED="\033[1;31m"
GREEN="\033[0;32m"
LIGHT_GREEN="\033[1;32m"
ORANGE="\033[0;33m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
LIGHT_BLUE="\033[1;34m"
PURPLE="\033[0;35m"
LIGHT_PURPLE="\033[1;35m"
CYAN="\033[0;36m"
LIGHT_CYAN="\033[1;36m"
LIGHT_GRAY="\033[0;37m"
WHITE="\033[1;37m"

NC="\033[0m"

function debug() {
    if $DEBUG; then
        echo -e "${WHITE}DEBUG  ${NC} : $1"
    fi
}
function info() {
    echo -e "${GREEN}INFO   ${NC} : $1"
}
function warning() {
    echo -e "${ORANGE}WARN   ${NC} : $1"
}
function error() {
    echo -e "${RED}ERROR  ${NC} : $1"
}

function get_distro_id() {
    local distro_id=$(grep '^ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
    echo "$distro_id"
}

function get_packages() {
    local packages=$1
    local overried=$2

    # for package in "${packages[@]}"; do

    # done
}

function update_packages() {
    local distro_id=$(get_distro_id)

    case "$distro_id" in
        debian|ubuntu)
            info "Updating repositories for Debian/Ubuntu..."
            sudo apt update
            ;;
        fedora)
            info "Updating repositories for Fedora..."
            sudo dnf check-update
            ;;
        arch)
            info "Updating repositories for Arch-based systems..."
            sudo pacman -Syu
            ;;
        *)
            error "Unsupported distribution: $ID"
            return 1
            ;;
    esac
}

function install_packages() {
    local distro_id=$(get_distro_id)
    local install_command


    case "$distro_id" in
        debian|ubuntu)
            install_command="apt install"
            ;;
        fedora)
            install_command="dnf install"
            ;;
        arch)
            install_command="pacman -S"
            ;;
        *)
            error "Unsupported distribution: $ID"
            return 1
            ;;
    esac

    sudo $install_command $@
}

function install_font_zip() {
    local url="$1"
    local filename="$(basename "$url")"

    mkdir -p "$HOME/.local/share/fonts"

    cd "$HOME/.local/share/fonts"

    wget "$url"

    unzip "$filename"

    rm "$filename"

    cd -

    # Refresh font cache
    fc-cache --force --vebose
}

function install_nerd_font() {
    local font="$1"
    local version="$2"
    local url=" https://github.com/ryanoasis/nerd-fonts/releases/download/v$version/$font.zip "
    install_font_zip "$url"
}


