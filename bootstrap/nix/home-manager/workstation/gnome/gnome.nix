{lib, ...}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
    ./nautilus.nix
    ./gedit.nix
  ];
}
