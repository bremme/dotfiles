#!/usr/bin/env bash

declare -a BASE_PACKAGES=(
    # essential cli
    git wget curl htop zsh command-not-found fzf 
    # nice to have cli
    imagemagick jq yq
    # fun cli
    cowsay fastfetch
    # development
    android-tools-adb android-tools-fastboot avrdude
    # network tools
    # hardware tools: disk, sensors
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





