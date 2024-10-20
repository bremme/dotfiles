{ pkgs, lib, ... }:

{
  imports = [
    ./terminal.nix
    ./gnome/gnome.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    android-tools
    kubectl
    helm
    dconf2nix
  ];
}