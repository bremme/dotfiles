#!/usr/bin/env bash

echo "ansible-playbook
    --inventory inventory.ini
    --limit $(hostname -f)
    --ask-become-pass
    --connection local
    -vvv
    $*
    local.yml"

ansible-playbook \
    --inventory inventory.ini \
    --limit "$(hostname -f)" \
    --ask-become-pass \
    --connection local \
    --verbose \
    "$@" \
    local.yml
