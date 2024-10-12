#!/usr/bin/env bash

# pre
ssh keys
git

dnf install git


git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

git clone git@github.com:bremme/dotfiles.git $HOME/git/dotfiles

