{ lib, ... }:

{
  imports = [
    ./terminal.nix
    ./dconf.nix
    ./vscode.nix
  ];
}