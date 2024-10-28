#!/usr/bin/env bash

# user dirs:    .config/user-dirs.dirs
# bookmarks:    .config/gtk-3.0/bookmarks

source $(dirname "$0")/utils.sh

function install_nemo() {
    local name="Nemo (deb)"
    log_info "Install '$name'"
    sudo apt install nemo

    # Set nemo as default application
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
    # disable nautilus from displaying desktop icons
    gsettings set org.gnome.desktop.background show-desktop-icons false
    gsettings set org.nemo.desktop show-desktop-icons true
}

function install_nautilus() {
    local name="Nautilus (deb)"
    log_info "Install '$name'"
    sudo apt install nautilus

    # Set naulitus as default application
    xdg-mime default nautilus.desktop inode/directory application/x-gnome-saved-search
    # disable nautilus from displaying desktop icons
    gsettings set org.gnome.desktop.background show-desktop-icons true
        gsettings set org.nemo.desktop show-desktop-icons false
}

echo "Which filemanager do you want to use?"
echo ""
echo "1. nautilus"
echo "2. nemo "
echo ""
number=$(choose_number)

if [ "$number" -eq 1 ]; then
    install_nautilus
elif [ "$number" -eq 2 ]; then
    install_nemo
else
    log_info "Unknown filemanager '$number'"
fi