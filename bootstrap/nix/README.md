# Bootstrap

* change shell to zsh
* copy ssh keys
* setup flakes
* install home-manager

## Setup ssh keys

```shell
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
```

## Install

`$ home-manager switch --flake .`

# Maintenance


# What home manager can't do

* change shell
  * chsh -s $(which zsh)


# TODO

move to flake setup
use variable for font and use everywhere, terminal, vscode etc.
git alias
devenv, direnv is probably the way to go for development environments.