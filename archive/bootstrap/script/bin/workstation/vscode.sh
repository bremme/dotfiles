#!/usr/bin/env bash

sudo apt install code

declare -a extensions=(
    # python
    ms-python.python
    ms-python.vscode-pylance
    ms-python.debugpy
    ms-python.black-formatter
    # nix
    # bbenoist.nix
    jnoortheen.nix-ide
    kamadorueda.alejandra
    # markdown
    yzhang.markdown-all-in-one
    davidanson.vscode-markdownlint
    # missing languages / formats
    redhat.vscode-yaml
    tamasfe.even-better-toml
    redhat.vscode-xml
    tomoki1207.pdf
    timonwong.shellcheck
    # spell check
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-dutch
    # copilot
    github.copilot
    github.copilot-chat
    # path intelli sense
    christian-kohler.path-intellisense
    # themes and icons
    zhuangtongfa.material-theme
    dracula-theme.theme-dracula
    github.github-vscode-theme
    pkief.material-icon-theme
)

for extension in "${extensions[@]}"
do
    code --install-extension "$extension" --force
done