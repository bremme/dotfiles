{ pkgs, lib, ... }:

{
  imports = [
    ./terminal.nix
    ./gnome.nix
    ./vscode.nix
  ];
}