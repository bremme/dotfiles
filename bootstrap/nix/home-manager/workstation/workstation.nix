{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./terminal.nix
    ./gnome/gnome.nix
    ./vscode.nix
    ./python.nix
  ];

  home.packages = with pkgs; [
    android-tools
    kubectl
    helm
    dconf2nix

    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})

    # GUI apps
    gnome.dconf-editor
    # gnome.gnome-terminal
    gnome.gnome-tweaks
  ];
}
