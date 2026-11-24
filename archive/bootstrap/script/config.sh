#!/usr/bin/env bash

declare -a BASE_PACKAGES=(
    # base
    bat
    command-not-found 
    cowsay
    curl 
    eza
    # fastfetch (not available in Ubuntu 24.04)
    fd-find 
    fzf
    git 
    tar
    htop 
    jq
    unzip
    wget
    yq
    zsh
    zoxide
)

declare -a WORKSTATION_PACKAGES=(
    imagemagick
    android-tools-adb 
    android-tools-fastboot 
    avrdude
    lm-sensors
    gparted
    dconf-editor
    build-essential
    mosquitto-clients
    arp-scan
    jstest-gtk
    flameshot
    gnome-software
    gnome-software-plugin-snap 
    gnome-software-plugin-flatpak
    pipx
)

declare -A WORKSTATION_PACKAGES_DISTRO_OVERRIDES

declare -A BASE_PACKAGES_DISTRO_OVERRIDES=(
    # Ubuntue overrides
    # Fedora overrides
    ["fedora:imagemagick"]="ImageMagick"
    ["fedora:android-tools-adb"]="android-tools"
    ["fedora:android-tools-fastboot"]=" "
    ["fedora:command-not-found"]="PackageKit-command-not-found"
    ["fedora:lm-sensors"]="lm_sensors"
    ["fedora:apt-transport-https"]=" "
)





