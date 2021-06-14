#!/usr/bin/env bash

# disable modal dialogs
gsettings set org.gnome.mutter attach-modal-dialogs false

# dash-to-dock extension ###############################################################
# set dock to bottom to prevent sticking
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "'BOTTOM'"
# autohide the dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
# disable the dock completely
# gnome-extensions disable ubuntu-dock@ubuntu.com


# use alt tab to switch application AND use alt+super tab to switch windows
# default is the other way around
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"