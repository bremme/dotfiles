#!/usr/bin/env bash

ansible-playbook \
    --inventory inventory.ini \
    --limit "$(hostname -f)" \
    --ask-become-pass \
    --connection local \
    --verbose \
    local.yml