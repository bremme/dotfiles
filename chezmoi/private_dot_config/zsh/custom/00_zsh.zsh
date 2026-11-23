# History settings
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Use up/down to complete command from history (instead of looping through previous commands)

# These work on macOS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# These work on Ubuntu
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down



# Remove characters from WORDCHARS that should not be considered part of a word for moving forward/backward
# default: *-?_-.[]~=/&;!#$%^(){}<>
WORDCHARS='*?[]~=/;!%^(){}<>'

# CTRL+LEFT and CTRL+RIGHT for moving by words
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word