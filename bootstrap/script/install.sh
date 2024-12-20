#!/usr/bin/env bash
set -e

script_dir="$(dirname "$0")"

source "$script_dir/lib/utils.sh"

info "Update packages"

update_packages

info "Bootstrap base configuration"

"$script_dir/bin/base/install_base_packages.sh"
"$script_dir/bin/base/install_oh_my_zsh.sh"


# terminal app
# fonts

# cli tools

# dotfiles
# ssh keys
# install cli tools

# ## install starship
# curl -sS https://starship.rs/install.sh | sh

# ## install nerd font
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip 
# unzip FiraCode.zip
# rm FireCode.zip
# fc-cache --force --vebose

# # install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sudo chsh -s $(which zsh) "$USER"


# # install homeshick
# git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
# source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# homeshick clone git@github.com:bremme/dotfiles.git
# homeshick link -f -b