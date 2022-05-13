#!/usr/bin/env bash

echo -n "Enter the username of the remote machine: "
read remote_user
echo -n "Enter the hostname of the remote machine: "
read remote_host

key_name="id_rsa-$remote_user@$remote_host"
key_comment="$remote_user@$remote_host from $USER@$(hostname)"

echo "Will create a key with filename: $key_name"
echo "Will create a key with comment: $key_comment"

# ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/$key_name" -a 100 -C "$key_comment"
ssh-keygen -t ed25519 -f "$HOME/.ssh/$key_name" -a 64 -C "$key_comment"

