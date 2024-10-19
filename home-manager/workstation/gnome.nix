{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
        show-warning = false;
    };

    # Shortcuts
    "org/gnome/settings-daemon/plugins/media-keys" = {
      home = [ "<Super>e" ];
    }; 

    # Keyboard shortcuts ######################################################
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