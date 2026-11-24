# History settings
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Use up/down to complete command from history (instead of looping through previous commands)
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Remove characters from WORDCHARS that should not be considered part of a word for moving forward/backward
# default: *-?_-.[]~=/&;!#$%^(){}<>
WORDCHARS='*?[]~=/;!%^(){}<>'

# CTRL+LEFT and CTRL+RIGHT for moving by words
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word