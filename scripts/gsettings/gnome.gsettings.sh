#!/usr/bin/env bash

THEME_COLOR="viridian"

# disable modal dialogs
gsettings set org.gnome.mutter attach-modal-dialogs false

# dash-to-dock extension ###############################################################
# disable the dock completely
gnome-extensions disable ubuntu-dock@ubuntu.com
# # set dock to bottom to prevent sticking
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "'BOTTOM'"
# # autohide the dock
# gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# org.gnome.desktop.interface
gsettings set org.gnome.desktop.interface clock-show-weekday "true"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$THEME_COLOR"


# org.gnome.desktop.calendar
gsettings set org.gnome.desktop.calendar show-weekdate "true"


# use alt tab to switch application AND use alt+super tab to switch windows
# default is the other way around
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"

