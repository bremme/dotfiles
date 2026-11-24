#!/usr/bin/env bash

gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor right-margin-position 88
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme solarized-dark
gsettings set org.gnome.gedit.preferences.editor insert-spaces true

gsettings set org.gnome.gedit.plugins active-plugins "['quickopen', 'time', 'quickhighlight', 'modelines', 'spell', 'docinfo', 'filebrowser']"