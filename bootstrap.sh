#!/usr/bin/env bash

sudo apt install pipx git

pipx install --include-deps ansible

pipx ensurepath
eval "$(register-python-argcomplete pipx)"
