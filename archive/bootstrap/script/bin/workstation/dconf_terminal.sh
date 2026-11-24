#!/usr/bin/env bash

# terminal
font="FiraCode Nerd Font Mono"
fontSize="12"

## Themes
defaultId="b1dcc9dd-5262-4d8d-a863-c897e6d979b9"
acoId="30458ca9-faed-44d3-bd89-ad8523c16850"
actiId="224ef8d8-a61d-43ec-b8b0-889750dca5cc"
atelierEstuaryId="4d721a4e-237b-43ae-9dab-86f285550ae4"

dconf write /org/gnome/terminal/legacy/keybindings/zoom-in "'<Ctrl>equal'"

dconf write "/org/gnome/terminal/legacy/profiles:/default" "'$acoId'"
dconf write "/org/gnome/terminal/legacy/profiles:/list"  \
"[\
    '$defaultId',\
    '$acoId',\
    '$actiId',\
    '$atelierEstuaryId'\
]"

# Default
dconf write "/org/gnome/terminal/legacy/profiles:/:$defaultId/visible-name" "'Default'"
dconf write "/org/gnome/terminal/legacy/profiles:/:$defaultId/audible-bell" true
dconf write "/org/gnome/terminal/legacy/profiles:/:$defaultId/use-system-font" false
dconf write "/org/gnome/terminal/legacy/profiles:/:$defaultId/use-theme-colors" true

# Aco theme
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/background-color "'#1F1F13130505'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/bold-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/cursor-background-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/cursor-colors-set true
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/cursor-foreground-color "'#1F1F13130505'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/font "'${font} ${fontSize}'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/foreground-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/palette "['#3F3F3F3F3F3F', '#FFFF08088383', '#8383FFFF0808', '#FFFF83830808', '#08088383FFFF', '#83830808FFFF', '#0808FFFF8383', '#BEBEBEBEBEBE', '#474747474747', '#FFFF1E1E8E8E', '#8E8EFFFF1E1E', '#FFFF8E8E1E1E', '#1E1E8E8EFFFF', '#8E8E1E1EFFFF', '#1E1EFFFF8E8E', '#C4C4C4C4C4C4']"
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/use-theme-background false
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:$acoId/visible-name "'Aco'"

# Acti theme
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/background-color "'#0D0D19192626'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/bold-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/cursor-background-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/cursor-colors-set true
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/cursor-foreground-color "'#0D0D19192626'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/font "'${font} ${fontSize}'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/foreground-color "'#B4B4E1E1FDFD'"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/palette "['#363636363636', '#FFFF08088383', '#8383FFFF0808', '#FFFF83830808', '#08088383FFFF', '#83830808FFFF', '#0808FFFF8383', '#B6B6B6B6B6B6', '#424242424242', '#FFFF1E1E8E8E', '#8E8EFFFF1E1E', '#FFFF8E8E1E1E', '#1E1E8E8EFFFF', '#8E8E1E1EFFFF', '#1E1EFFFF8E8E', '#C2C2C2C2C2C2']"
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/use-theme-background false
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:$actiId/visible-name "'Aci'"

# AteleirEstuary theme
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/background-color "'#222222221B1B'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/bold-color "'#878785857373'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/cursor-background-color "'#878785857373'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/cursor-colors-set true
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/cursor-foreground-color "'#222222221B1B'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/font "'${font} ${fontSize}'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/foreground-color "'#878785857373'"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/palette "['#BABA62623636', '#BABA62623636', '#7D7D97972626', '#A5A598980D0D', '#3636A1A16666', '#9D9D6C6C7C7C', '#5B5B9D9D4848', '#E7E7E6E6DFDF', '#6C6C6B6B5A5A', '#AEAE73731313', '#7D7D97972626', '#A5A598980D0D', '#5F5F91918282', '#9D9D6C6C7C7C', '#5B5B9D9D4848', '#F4F4F3F3ECEC']"
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/use-theme-background false
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:$atelierEstuaryId/visible-name "'Atelier Estuary'"
