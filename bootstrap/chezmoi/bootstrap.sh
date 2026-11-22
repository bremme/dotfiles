#!/usr/bin/env bash

mkdir -pv ~/.config/chezmoi
cp -v chezmoi.yaml ~/.config/chezmoi/chezmoi.yaml

echo "Install chezmoi"

sudo apt install chezmoi -y

# If install failed, try installing via the official script
if ! command -v chezmoi &> /dev/null; then
    sh -c "$(curl -fsLS https://get.chezmoi.io)"
fi