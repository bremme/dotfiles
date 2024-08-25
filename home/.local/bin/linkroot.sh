#!/usr/bin/env bash

# link user scripts to /usr/local/bin to make them accessible to sudo commands and root

ORIGINAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(getent passwd "$ORIGINAL_USER" | cut -d: -f6)

USER_BIN_DIR=$(readlink -f "$USER_HOME/bin")
ROOT_BIN_DIR=/usr/local/bin

find "$USER_BIN_DIR" -maxdepth 1 -type f | while read -r entry; do
    entry_name=$(basename "$entry")
    dest_entry="$ROOT_BIN_DIR/$entry_name"

    echo "[INFO] ln -sfv $entry $dest_entry"
    ln -sfv "$entry" "$dest_entry"
done