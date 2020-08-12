#!/usr/bin/env bash

# Set right hand tabbing
gsettings\
  set org.gnome.desktop.wm.keybindings switch-applications\
  "['<Super>Tab', '<Alt>Tab', '<Ctrl>backslash']"
# Set right hand tabbing backwards
gsettings\
  set org.gnome.desktop.wm.keybindings switch-applications-backward\
  "['<Shift><Super>Tab', '<Shift><Alt>Tab', '<Shift><Ctrl>backslash']"
# Set right hand group tabbing
gsettings\
  set org.gnome.desktop.wm.keybindings  switch-group\
  "['<Super>Above_Tab', '<Alt>Above_Tab', '<Ctrl>backspace']"
# Set right hand group tabbing backwards
gsettings\
  set org.gnome.desktop.wm.keybindings  switch-group-backward\
  "['<Shift><Super>Above_Tab', '<Shift><Alt>Above_Tab', '<Shift><Ctrl>backspace']"


# unload auto suspend module (prevents buzzing sounds when soundcard is turned off after idling for x seconds)
pactl unload-module module-suspend-on-idle
