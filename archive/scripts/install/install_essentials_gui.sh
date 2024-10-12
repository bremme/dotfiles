#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

function install_essentials_gui() {
    local name="Essentials GUI"

    # Install deb packages #############################################################
    log_info "Install '$name' (deb)"
    log_info "Going to install: ${ESSENTIAL_GUI_PACKAGES[*]}"
    sudo apt install -y ${ESSENTIAL_GUI_PACKAGES[*]}
    # configure flatpak
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # Install snap packages ############################################################
    log_info "Install '$name' (snap)"
    sudo apt install -y snapd
    log_info "Going to install: ${ESSENTIAL_GUI_SNAP_PACKAGES[*]}"
    sudo snap install ${ESSENTIAL_GUI_SNAP_PACKAGES[*]}

    # Install manual deb packages ######################################################

    # Install teamviewer (manual deb)
    install_deb "teamviewer" "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
    # log_info "Install Teamviewer (manual deb)"
    # wget --directory-prefix /tmp https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    # sudo apt install /tmp/teamviewer_amd64.deb
    # rm -f /tmp/teamviewer_amd64.deb

    # Install Skype (manual deb)
    install_deb "skypeforlinux" "https://go.skype.com/skypeforlinux-64.deb"
    # log_info "Install Skype (manual deb)"
    # wget --directory-prefix /tmp https://go.skype.com/skypeforlinux-64.deb
    # sudo apt install /tmp/skypeforlinux-64.deb
    # rm -f /tmp/skypeforlinux-64.deb

    # Install Teams (manual deb)
    # install_deb "Teams" "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb"

    # Install AppImages ################################################################
    # TODO
    # install_freecad
    # install_cura
    # install_keepassxc

    log_info "Finished installing '$name'"
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_essentials_gui
fi