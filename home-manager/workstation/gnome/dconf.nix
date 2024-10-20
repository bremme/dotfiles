{ ... }:

{
    dconf.settings = {
    "ca/desrt/dconf-editor" = {
        show-warning = false;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "'prefer-dark'";
      gtk-theme = "'Adwaita-dark'";
      show-battery-percentage = true;
      clock-show-weekday = true;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gnome/shell/overrides" = {
      attach-modal-dialogs = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "':minimize,maximize,close'";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 3700;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
    };

    # Keyboard shortcuts ######################################################
    "org/gnome/settings-daemon/plugins/media-keys" = {
      home = [ "<Super>e" ];
    }; 
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
    };

    # Custom shortcut
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ 
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" 
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" 
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" 
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "gnome-terminal";
      name = "Open terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Shift><Control>Escape";
      command = "gnome-system-monitor";
      name = "Open system monitor";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Shift><Super>s";
      command = "flameshot-gui";
      name = "Take screenshot with Flameshot";
    };

  }; 
}