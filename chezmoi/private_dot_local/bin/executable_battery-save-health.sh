#!/usr/bin/env bash

sudo sh -c "echo 60 > /sys/class/power_supply/BAT0/charge_control_start_threshold"
sudo sh -c "echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold"