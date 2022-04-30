#!/usr/bin/env bash

# source config
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "$SCRIPT_DIR/../config.sh"

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

function log_debug() {
    echo -e "${WHITE}DEBUG  ${NC} : $1"
}
function log_info() {
    echo -e "${GREEN}INFO   ${NC} : $1"
}
function log_warning() {
    echo -e "${ORANGE}WARNING${NC} : $1"
}
function log_error() {
    echo -e "${RED}ERROR  ${NC} : $1"
}

function confirm() {
    read -r -p "$1 [Y/n]" response
    case "$response" in
        [yY][eE][sS]|[yY])
            echo true
            ;;
        *)
            echo false
            ;;
    esac
}

function choose_number() {
    read -r -p "Chose a number: " number
    echo "$number"
}

function read_answer() {
    read -r -p "$1: " answer
    echo $answer
}


function install_deb() {
    name="$1"

    if [ $(package_is_installed "$name") -eq 1 ]; then
        log_warning "Package '$name' is already installed"
        return 0
    fi

    url="$2"
    log_info "Install '$name' (manual deb)"
    wget "$url" -O "/tmp/$name.deb"
    sudo apt install "/tmp/$name.deb"
    rm -f "/tmp/$name.deb"
}

function package_is_installed() {
    echo "$(dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed")"
}

function install_appimage() {
    long_name="$1"
    download_link="$2"
    mkdir -p $APPIMAGE_FOLDER
    mkdir -p $APPIMAGE_ICON_FOLDER
    # download AppImage
    wget --output-document "$APPIMAGE_FOLDER/$long_name.AppImage" "$download_link"
    # make executable
    chmod +x "$APPIMAGE_FOLDER/$long_name.AppImage"
}

function install_appimage_desktop_integration() {
    short_name="$(santize_name $1)"
    cp "$SCRIPT_DIR/../launchers/$short_name-appimage.desktop" "$HOME/.local/share/applications/"
    ln -s -f $HOME/.local/share/applications $APPIMAGE_FOLDER
    cp "$SCRIPT_DIR/../launchers/$short_name.png" "$APPIMAGE_ICON_FOLDER/"
    chmod +x $HOME/.local/share/applications/$short_name-appimage.desktop
}

function santize_name() {
    echo "$1" | tr -s ' ' '_' | tr '[:upper:]' '[:lower:]'
}