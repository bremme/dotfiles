{ pkgs, lib, ... }:

with lib.hm.gvariant;

{
  programs.gnome-shell = with pkgs.gnomeExtensions; {
    enable = true;
    extensions = [
      {
        id = "caffeine@patapon.info";
        package = caffeine;
      }
      {
        id = "Vitals@CoreCoding.com";
        package = vitals;
      }
    ];
  };

  # Extensions settings
  dconf.settings = {

    "org/gnome/shell/extensions/vitals" = {
      icon-style = mkInt32 1;
    };
  };
}