#!/usr/bin/env bash

dconf write /org/gnome/TextEditor/use-system-font false
dconf write /org/gnome/TextEditor/custom-font "'FiraCode Nerd Font Mono 12'"
dconf write /org/gnome/TextEditor/highlight-current-line true
dconf write /org/gnome/TextEditor/indent-style "'space'"
dconf write /org/gnome/TextEditor/tab-width 4
dconf write /org/gnome/TextEditor/show-line-numbers true
dconf write /org/gnome/TextEditor/show-map true
dconf write /org/gnome/TextEditor/show-right-margin true
dconf write /org/gnome/TextEditor/style-scheme "'solarized-dark'"