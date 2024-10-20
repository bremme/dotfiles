{ lib,... }:


{

  dconf.settings = {

    "org/gnome/TextEditor" = {
      use-system-font = false;
      custom-font = "FiraCode Nerd Font Mono 12";
      highlight-current-line = true;
      indent-style = "space";
      tab-width = mkUint32 4;
      show-line-numbers = true;
      show-map = true;
      show-right-margin = true;
      style-scheme = "solarized-dark";
    };
    
  };
}