# add user@host to prompt for robbyrussel theme
if [[ "$ZSH_THEME" == "robbyrussell" ]] ; then
  PROMPT="%{$fg_bold[white]%}%n@%{$fg_bold[green]%}%m%{$reset_color%} ${PROMPT}"
fi