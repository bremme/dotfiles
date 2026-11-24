#!/usr/bin/env bash

source $(dirname "$0")/utils.sh

for file in $(dirname "$0")/gsettings/*; do
    if [ $(confirm "Do you want to apply gsettings '$file'?") = true ]; then
        log_info "Apply gsettings: '$file'"
        $file
    fi

done