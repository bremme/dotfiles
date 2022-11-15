#!/usr/bin/env bash

default_alg="ed25519"
rounds="64"

read -p "Enter the username of the remote machine: " remote_user
read -p "Enter the hostname of the remote machine: " remote_host

read -p "Enter algorithm to use ($default_alg): " alg

alg=${alg:-$default_alg}

key_name="id_$alg-$remote_user@$remote_host"
key_comment="$remote_user@$remote_host from $USER@$(hostname)"

echo "Will create a key with filename: $key_name"
echo "Will create a key with comment: $key_comment"

echo "ssh-keygen -t "$alg" -f "$HOME/.ssh/$key_name" -a "$rounds" -C "$key_comment""
ssh-keygen -t "$alg" -f "$HOME/.ssh/$key_name" -a "$rounds" -C "$key_comment"

