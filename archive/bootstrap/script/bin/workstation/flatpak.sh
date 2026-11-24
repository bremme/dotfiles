#!/usr/bin/env bash

sudo apt install flatpak gnome-software gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak update --appstream