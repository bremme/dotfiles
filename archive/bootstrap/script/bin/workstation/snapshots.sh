#!/usr/bin/env bash

wget https://download.opensuse.org/repositories/home:/iDesmI:/more/Debian_12/amd64/btrfs-assistant_1.8-1+3.8_amd64.deb -P /tmp

sudo apt install /tmp/btrfs-assistant_1.8-1+3.8_amd64.deb

sudo apt install snapper