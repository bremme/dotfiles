#!/usr/bin/env bash

LIST_VIEW_SCHEMA="org.gnome.nautilus.list-view"
PREFERENCE_SCHEMA="org.gnome.nautilus.preferences"

# to reset back to default
if [[ "$1" == "reset" ]]; then
    gsettings reset-recursively $LIST_VIEW_SCHEMA
    gsettings reset-recursively $PREFERENCE_SCHEMA
    exit 0
fi
# list-view
gsettings set $LIST_VIEW_SCHEMA use-tree-view true
# preferences
gsettings set $PREFERENCE_SCHEMA show-delete-permanently true
gsettings set $PREFERENCE_SCHEMA executable-text-activation ask
gsettings set $PREFERENCE_SCHEMA show-directory-item-counts always
gsettings set $PREFERENCE_SCHEMA show-image-thumbnails always
gsettings set $PREFERENCE_SCHEMA show-create-link true
gsettings set $PREFERENCE_SCHEMA use-experimental-views true