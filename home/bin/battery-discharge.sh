#!/usr/bin/env bash

set -e

SET_POINT=$1

trap 'stop_discharging' EXIT

is_below_set_point() {
    local set_point=$1
    local current_charge
    
    current_charge=$(cat /sys/class/power_supply/BAT0/capacity)

    if (( current_charge > set_point )); then
        return 1
    fi
    
    return 0
}

start_discharing() {
    echo "Start discharing battery"
    echo "force-discharge" | sudo tee /sys/class/power_supply/BAT0/charge_behaviour > /dev/null
}

stop_discharging() {
    echo "Stop discharging battery"
    echo "auto" | sudo tee /sys/class/power_supply/BAT0/charge_behaviour  > /dev/null
}

if is_below_set_point "$SET_POINT"; then
    echo "Battery is already below $SET_POINT, exit"
    exit 0
fi

start_discharing

while ! is_below_set_point "$SET_POINT"; do
    echo "Not yet below $SET_POINT %, current charge is $(cat /sys/class/power_supply/BAT0/capacity) %"
    sleep 10
done

echo "Reached $SET_POINT %, stop discharging"

stop_discharging