#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

if [ $(confirm "Do you want to add a new user") = true ]; then

    new_user="$(read_answer "New user name: ")"

    # Use the highlevel adduser command (useradd is low-level)
    sudo adduser "$new_user"

    current_user_groups=($(groups))

    # usermod -a -G group1,group2 username

    for group in ${current_user_groups[@]}
    do
        # add new_user to group of current user
        sudo adduser $new_user $group
    done

if

# change hostname

# set static ip

# generate locales

