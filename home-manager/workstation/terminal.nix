{ pkgs, lib, ... }:

{
  packages = with pkgs; [
    gnome.gnome-terminal
  ];
}