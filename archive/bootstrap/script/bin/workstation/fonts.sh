#!/usr/bin/env bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip
mkdir -p ~/.local/share/fonts
unzip -o /tmp/FiraCode.zip -d ~/.local/share/fonts
sudo fc-cache -f -v