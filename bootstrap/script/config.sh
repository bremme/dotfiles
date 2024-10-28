#!/usr/bin/env bash

declare -a BASE_PACKAGES=(
    # base
    command-not-found 
    cowsay
    curl 
    eza
    fastfetch
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
)

declare -A BASE_PACKAGES_DISTRO_OVERRIDES=(
    # Ubuntue overrides
    # Fedora overrides
    ["fedora:imagemagick"]="ImageMagick"
    ["fedora:android-tools-adb"]="android-tools"
    ["fedora:android-tools-fastboot"]=" "
    ["fedora:command-not-found"]="PackageKit-command-not-found"
    ["fedora:lm-sensors"]="lm_sensors"
    ["apt-transport-https"]=" "
)





