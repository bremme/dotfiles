#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../lib/utils.sh"

# install oh-my-zshx
if [ -d "$HOME/.oh-my-zsh" ]; then
    warning "Oh-my-zsh already installed, skipping"
    return 0
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# install starship
curl -sS https://starship.rs/install.sh | sh
# change shell
info "Changing default shell to zsh for $USER"
sudo chsh -s "$(which zsh)" "$USER"x