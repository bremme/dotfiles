#!/usr/bin/env bash

mkdir -pv ~/.config/chezmoi
cp -v chezmoi.yaml ~/.config/chezmoi/chezmoi.yaml

echo "Install chezmoi"

sudo apt install chezmoi -y