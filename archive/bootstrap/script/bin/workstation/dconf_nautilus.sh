#!/usr/bin/env bash

dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'medium'"
dconf write /org/gnome/nautilus/list-view/default-zoom-level "'small'"
dconf write /org/gnome/nautilus/list-view/use-tree-view true
dconf write /org/gnome/nautilus/preferences/default-folder-viewer "'list-view'"
dconf write /org/gnome/nautilus/preferences/migrated-gtk-settings true
dconf write /org/gnome/nautilus/preferences/search-filter-time-type "'last_modified'"
dconf write /org/gnome/nautilus/preferences/show-create-link true
dconf write /org/gnome/nautilus/preferences/show-delete-permanently true
dconf write /org/gnome/nautilus/preferences/show-image-thumbnails "'always'"