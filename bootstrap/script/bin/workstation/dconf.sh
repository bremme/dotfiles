#!/usr/bin/env bash


# dconf

dconf write /ca/desrt/dconf-editor/show-warning false

## freedesktop
dconf write /org/freedesktop/tracker/miner/files/index-recursive-directories "['&DESKTOP', '&DOCUMENTS', '&MUSIC', '&PICTURES', '&VIDEOS', '/home/bremme/Sync', '/home/bremme/Data', '/home/bremme/Local']"

## gnome
dconf write /org/gnome/desktop/calendar/show-weekdate true

dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'" 
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Yaru-blue'"
dconf write /org/gnome/desktop/interface/show-battery-percentage true

dconf write /org/gnome/desktop/peripherals/touchpad/tap-to-click true

dconf write /org/gnome/desktop/sound/allow-volume-above-100-percent true

dconf write /org/gnome/desktop/wm/preferences/button-layout "':minimize,maximize,close'"

dconf write /org/gnome/mutter/attach-modal-dialogs false

dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature 3700

dconf write /org/gnome/shell/overrides/attach-modal-dialogs false
dconf write /org/gnome/shell/weather/automatic-location true

dconf write /org/gnome/settings-daemon/plugins/media-keys/home "['<Super>e']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/control-center "['<Super>x']"
dconf write /org/gnome/desktop/wm/keybindings/show-desktop "['<Super>d']"

dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['<Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['<Shift><Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Super>Tab']"


# Set custom keyboard shortcuts
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings \
"[\
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',\
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',\
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/'\
]"

# Set custom keybinding "custom0"
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Control><Alt>t'"
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-terminal'"
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Open terminal'"

# Set custom keybinding "custom1"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Shift><Control>Escape'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'gnome-system-monitor'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Open system monitor'"

# Set custom keybinding "custom2"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Shift><Super>s'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'flameshot-gui'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'Take screenshot with Flameshot'"


dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'us+intl')]"