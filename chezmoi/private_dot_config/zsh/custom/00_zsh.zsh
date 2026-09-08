# History settings
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Use up/down to complete command from history (instead of looping through previous commands)

# These work on macOS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down