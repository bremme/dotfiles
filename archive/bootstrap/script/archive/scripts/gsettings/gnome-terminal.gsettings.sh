#!/usr/bin/env bash
USE_DEFAULT_PROFILE=true

DEFAULT_UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
SCHEMA="org.gnome.Terminal.Legacy.Profile"
DEFAULT_SCHEMA_PATH="$SCHEMA:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_UUID/"

if [ $USE_DEFAULT_PROFILE == false ]; then
    PROFILE_NAME="One Dark"
    PROFILE_UUID=$(uuidgen)

    SCHEMA_PATH="$SCHEMA:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/"
    PROFILES_LIST="$(gsettings get org.gnome.Terminal.ProfilesList list | sed 's/.$//'), '$PROFILE_UUID']"
    gsettings set org.gnome.Terminal.ProfilesList list "$PROFILES_LIST"
    echo "Generating new gnome-terminal-profile: $PROFILE_NAME ($PROFILE_UUID)"
    gsettings set $SCHEMA_PATH visible-name "'$PROFILE_NAME'"
else
    SCHEMA_PATH=$DEFAULT_SCHEMA_PATH
    PROFILE_UUID=$DEFAULT_UUID
fi

# list all properties that can be configured
# gsettings list-keys $DEFAULT_SCHEMA_PATH

# One dark (See https://github.com/denysdovhan/one-gnome-terminal)
gsettings set $SCHEMA_PATH palette "['#000000', '#e06c75', '#98c379', '#d19a66', '#61afef', '#c678dd', '#56b6c2', '#abb2bf', '#5c6370', '#e06c75', '#98c379', '#d19a66', '#61afef', '#c678dd', '#56b6c2', '#ffffff']"
gsettings set $SCHEMA_PATH background-color "'#282c34'"
gsettings set $SCHEMA_PATH foreground-color "'#abb2bf'"
gsettings set $SCHEMA_PATH bold-color "'#ABB2BF'"
gsettings set $SCHEMA_PATH bold-color-same-as-fg "true"
gsettings set $SCHEMA_PATH bold-is-bright "true"
gsettings set $SCHEMA_PATH use-theme-colors "false"

echo "Setting $PROFILE_UUID as default"

gsettings set org.gnome.Terminal.ProfilesList default "'$PROFILE_UUID'"

# Other customizations (keybindings)
KEYBINDING_SCHEMA="org.gnome.Terminal.Legacy.Keybindings"
KEYBINDING_PATH="/org/gnome/terminal/legacy/keybindings/"
KEYBINDING_SCHEMA_PATH="$KEYBINDING_SCHEMA:$KEYBINDING_PATH"

gsettings set "$KEYBINDING_SCHEMA_PATH" zoom-in "'<Ctrl>equal'"
