#!/usr/bin/env bash

source $(dirname "$0")/utils.gsettings.sh

ARG="$1"

SCHEMA="org.gnome.settings-daemon.plugins.media-keys"

# default shortcuts
gsettings set $SCHEMA home "['<Super>e']"
gsettings set $SCHEMA terminal "['<Primary><Alt>t']"
gsettings set $SCHEMA control-center "['<Super>x']"

# add custom shortcuts
CUSTOM_KEYBINDINGS_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# gnome-system-monitor (100)
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom100/ name "'Launch system monitor'"
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom100/ command "'gnome-system-monitor'"
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom100/ binding "'<Primary><Shift>Escape'"
# TODO custom keybindings should be added to custom-keybindings array
# CUSTOM_KEYBINDINGS="$(gsettings get $SCHEMA custom-keybindings)"

# flameshot (101)
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ name "'Create screenshot'"
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ command "'flameshot gui'"
gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ binding "'<Shift><Super>s'"
# TODO custom keybindings should be added to custom-keybindings array

# KeePass2 (102)
if [ "$ARG" = "keepass2" ]; then
    gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ name "'KeePass2 auto-type'"
    gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ command "'mono /usr/lib/keepass2/KeePass.exe --auto-type'"
    gsettings set $SCHEMA.custom-keybinding:$CUSTOM_KEYBINDINGS_PATH/custom101/ binding "'<Primary><Alt>space'"
    # TODO custom keybindings should be added to custom-keybindings array
fi