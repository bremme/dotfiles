#!/usr/bin/env bash
# to keep my personal config organized there are three places where I want to move and link stuff

# .homeshick/repos/dotfiles   ->  config to share using git with different machines
# Local/appdata/              ->  config specific to this install or too big too share
# Local/rootdata/             ->  root config specific to this machine


# link.sh
#     hs

# Check if a path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

ORIGINAL_USER=${SUDO_USER}
USER_HOME=$(getent passwd "$ORIGINAL_USER" | cut -d: -f6)
APPDATA_FOLDER=$USER_HOME/Local/appdata
ROOTDATA_FOLDER=$USER_HOME/Local/rootdata

set -x

# Resolve the absolute path
source_path=$(readlink -f "$1")
source_path_dir=$(dirname "$source_path")

if [[ "$source_path" == "$USER_HOME"* ]]; then
    target_base="$APPDATA_FOLDER"
else
    target_base="$ROOTDATA_FOLDER"
fi

target_path="$target_base$source_path"
target_path_dir="$target_base$source_path_dir"

mkdir -p "$target_path_dir"
mv "$1" "$target_path"
ln -s "$target_path" "$source_path"