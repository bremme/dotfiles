{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnome.gnome-terminal
  ];

  dconf.settings = {

    "org/gnome/terminal/legacy/keybindings" = {
        zoom-in = "<Ctrl>equal";
    };
        # Profiles ################################################################
    "org/gnome/terminal/legacy" = {
      "profiles:" = [
        "/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/"
        "/org/gnome/terminal/legacy/profiles:/:30458ca9-faed-44d3-bd89-ad8523c16850/"
        "/org/gnome/terminal/legacy/profiles:/:224ef8d8-a61d-43ec-b8b0-889750dca5cc/"
        "/org/gnome/terminal/legacy/profiles:/:4d721a4e-237b-43ae-9dab-86f285550ae4/"
      ];
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "4d721a4e-237b-43ae-9dab-86f285550ae4";
      list = [
        # Default
        "b1dcc9dd-5262-4d8d-a863-c897e6d979b9"
        # Aco
        "30458ca9-faed-44d3-bd89-ad8523c16850"
        # Acti
        "224ef8d8-a61d-43ec-b8b0-889750dca5cc"
        # Atelier Estuary
        "4d721a4e-237b-43ae-9dab-86f285550ae4"
      ];
    };

    # Default
    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = true;
      font = "FiraCode Nerd Font Mono 12";
      use-system-font = false;
      use-theme-colors = true;
      visible-name = "Default";
    };

    # Aco
    "org/gnome/terminal/legacy/profiles:/:30458ca9-faed-44d3-bd89-ad8523c16850" = {
      allow-bold = true;
      audible-bell = true;
      background-color = "#1F1F13130505";
      backspace-binding = "ascii-delete";
      bold-color = "#B4B4E1E1FDFD";
      bold-color-same-as-fg = true;
      cursor-background-color = "#B4B4E1E1FDFD";
      cursor-blink-mode = "system";
      cursor-colors-set = true;
      cursor-foreground-color = "#1F1F13130505";
      cursor-shape = "block";
      delete-binding = "delete-sequence";
      font = "FiraCode Nerd Font Mono 12";
      foreground-color = "#B4B4E1E1FDFD";
      highlight-colors-set = false;
      login-shell = false;
      palette = [ "#3F3F3F3F3F3F" "#FFFF08088383" "#8383FFFF0808" "#FFFF83830808" "#08088383FFFF" "#83830808FFFF" "#0808FFFF8383" "#BEBEBEBEBEBE" "#474747474747" "#FFFF1E1E8E8E" "#8E8EFFFF1E1E" "#FFFF8E8E1E1E" "#1E1E8E8EFFFF" "#8E8E1E1EFFFF" "#1E1EFFFF8E8E" "#C4C4C4C4C4C4" ];
      scroll-on-output = true;
      scrollback-lines = 10000;
      scrollbar-policy = "always";
      use-custom-command = false;
      use-system-font = false;
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "Aco";
    };

    # Acti
    "org/gnome/terminal/legacy/profiles:/:224ef8d8-a61d-43ec-b8b0-889750dca5cc" = {
      allow-bold = true;
      audible-bell = true;
      background-color = "#0D0D19192626";
      backspace-binding = "ascii-delete";
      bold-color = "#B4B4E1E1FDFD";
      bold-color-same-as-fg = true;
      cursor-background-color = "#B4B4E1E1FDFD";
      cursor-blink-mode = "system";
      cursor-colors-set = true;
      cursor-foreground-color = "#0D0D19192626";
      cursor-shape = "block";
      delete-binding = "delete-sequence";
      font = "FiraCode Nerd Font Mono 12";
      foreground-color = "#B4B4E1E1FDFD";
      highlight-colors-set = false;
      login-shell = false;
      palette = [ "#363636363636" "#FFFF08088383" "#8383FFFF0808" "#FFFF83830808" "#08088383FFFF" "#83830808FFFF" "#0808FFFF8383" "#B6B6B6B6B6B6" "#424242424242" "#FFFF1E1E8E8E" "#8E8EFFFF1E1E" "#FFFF8E8E1E1E" "#1E1E8E8EFFFF" "#8E8E1E1EFFFF" "#1E1EFFFF8E8E" "#C2C2C2C2C2C2" ];
      scroll-on-output = true;
      scrollback-lines = 10000;
      scrollbar-policy = "always";
      use-custom-command = false;
      use-system-font = false;
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "Aci";
    };

    # Atelier Estuary
    "org/gnome/terminal/legacy/profiles:/:4d721a4e-237b-43ae-9dab-86f285550ae4" = {
      allow-bold = true;
      audible-bell = true;
      background-color = "#222222221B1B";
      backspace-binding = "ascii-delete";
      bold-color = "#878785857373";
      bold-color-same-as-fg = true;
      cursor-background-color = "#878785857373";
      cursor-blink-mode = "system";
      cursor-colors-set = true;
      cursor-foreground-color = "#222222221B1B";
      cursor-shape = "block";
      delete-binding = "delete-sequence";
      font = "FiraCode Nerd Font Mono 12";
      foreground-color = "#878785857373";
      highlight-colors-set = false;
      login-shell = false;
      palette = [ "#BABA62623636" "#BABA62623636" "#7D7D97972626" "#A5A598980D0D" "#3636A1A16666" "#9D9D6C6C7C7C" "#5B5B9D9D4848" "#E7E7E6E6DFDF" "#6C6C6B6B5A5A" "#AEAE73731313" "#7D7D97972626" "#A5A598980D0D" "#5F5F91918282" "#9D9D6C6C7C7C" "#5B5B9D9D4848" "#F4F4F3F3ECEC" ];
      scroll-on-output = true;
      scrollback-lines = 10000;
      scrollbar-policy = "always";
      use-custom-command = false;
      use-system-font = false;
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "NisOS (Atelier Estuary)";
    };
  };
}