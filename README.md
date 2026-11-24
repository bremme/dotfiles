# Dotfiles

This repository contains my personal dotfiles

## Pre-requirement

git
zsh
shell set to zsh

## Installation

Run the boostrap script to start the installation

```shell
./bootstrap.sh
```

This will:

* download chezmoi
* run chezmoi init
  * create the configuration (interactive)

## Testing

```shell
# Test a template 
chezmoi execute-template \
  --override-data '{"chezmoi":{"os":"linux","arch":"arm","osRelease":{"id":"raspbian","idLike":"lala"}}}' \
  -f chezmoi/.chezmoiscripts/run_onchange_after_update-packages.sh.tmpl
```