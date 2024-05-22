#!/usr/bin/env bash


private_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/private-config.sh"

if [ -f  $private_config ]; then
    source $private_config
fi

CURA_APPIMAGE_VERSION="4.9.1"
KEEPASSXC_APPIMAGE_VERSION="2.6.4"
TELEGRAM_VERSION="2.5.1"

APPIMAGE_FOLDER="$HOME/AppImage"
APPIMAGE_ICON_FOLDER="$APPIMAGE_FOLDER/icons"
APPS_FOLDER="$HOME/Apps"

declare -a VSCODE_EXTENSIONS=(
    "ms-python.python"
    "njpwerner.autodocstring"
    "ms-azuretools.vscode-docker"
    "lextudio.restructuredtext"
    "pkief.material-icon-theme"
    "akamud.vscode-theme-onedark"
    "yzhang.markdown-all-in-one"
    "nico-castell.linux-desktop-file"
    "zhuangtongfa.material-theme"
)
declare -a PLATFORMIO_VSCODE_EXTENSIONS=(
    "platformio.platformio-ide"
)

declare -a ESSENTIAL_PACKAGES=(
    # essential cli
    git wget curl htop zsh command-not-found tree fzf apt-transport-https gawk vim
    # nice to have cli
    imagemagick python-pygments jq
    # fun cli
    cowsay fortune toilet neofetch
    # development
    mosquitto-clients android-tools-adb android-tools-fastboot avrdude
    # network tools
    arp-scan nmap net-tools
    # hardware tools: disk, sensors
    smartmontools udisks2 lm-sensors
    # productivity
    taskwarrior
    snapd
)
declare -a ESSENTIAL_GUI_PACKAGES=(
    libreoffice hunspell-nl vlc steam gedit chromium-browser
    dconf-editor gnome-tweak-tool baobab gdmap
    darktable transmission sqlitebrowser zim meld
    network-manager-fortisslvpn network-manager-fortisslvpn-gnome openfortivpn
    gsmartcontrol gparted
    gnome-shell-extensions
    backintime-qt sshfs jstest-gtk
    flatpak flameshot
    # gnome shell extension system-monitor dependencies
    gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0
    # nautilus extensions
    nautilus-admin nautilus-extension-gnome-terminal
)
declare -a ESSENTIAL_GUI_SNAP_PACKAGES=(
    mqtt-explorer drawio
)

declare -a PYENV_VERSIONS=(
    "3.9.5"
)
PYENV_DEFAULT_VERSION="3.9.5"

declare -a PYENV_DEFAULT_PACKAGES=(
    wheel setuptools flake8 pytest ipython ipdb
)
