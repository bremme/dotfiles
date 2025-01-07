#!/usr/bin/env bash

sudo flatpak install flathub com.mattjakeman.ExtensionManager

sudo apt install pipx

pipx install gnome-extensions-cli --system-site-packages

# install extensions
gext install Vitals@CoreCoding.com
gext install caffeine@patapon.info
gext install order-extensions@wa4557.github.com

# configure extensions
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/extensions/dash-to-dock/multi-monitor true

dconf write /org/gnome/shell/extensions/tiling-assistant/enable-tiling-popup false