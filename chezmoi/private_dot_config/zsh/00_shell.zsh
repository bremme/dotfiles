# Default shell tools ##########################################################################
# reload zsh
alias rlz="source ~/.zshrc"

# chmod
alias chmox='chmod +x'
# grep process
alias proc="ps aux | grep"

# set good defaults for cp
alias cp="cp --interactive --recursive --archive --verbose"
# set good defaults for rm
alias rm="rm -r -I -v"
# set good defaults for mkdir
alias mkdir="mkdir -p -v"
# set good defaults for mv
alias mv="mv --interactive --verbose"
# set good defaults for tree
alias tree="tree -a -I .git"

if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init --cmd cd zsh)"
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"


if command -v fzf > /dev/null 2>&1; then
   source <(fzf --zsh)
fi

if command -v eza > /dev/null 2>&1; then
   eza_common_args="--group --group-directories-first --icons always"
   alias l="eza -l $eza_common_args"
   alias la="eza -la $eza_common_args"
   alias ls="eza $eza_common_args"

   eza_tree_args="--tree"
   alias lt="eza $eza_tree_args $eza_common_args --level=2"
   alias lt3="eza $eza_tree_args $eza_common_args --level=3"
fi

if command -v bat > /dev/null 2>&1; then
   alias cat="bat --style=plain --paging=never"
   alias catb="$(which cat)"
fi

if command -v chezmoi > /dev/null 2>&1; then
   alias chez=chezmoi
   alias cheza="chezmoi -v apply"
   alias chezd="chezmoi -v diff"
   alias chezs="chezmoi -v status"
fi

# Dev shell tools ################################################################################
# git
# See https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git for more inspiration
if command -v git > /dev/null 2>&1; then
   function _git_commit_message() {
      git commit -m "$*"
   }
   alias gst="git status"
   alias ga= "git add"
   alias gau="git add --update"
   alias gaa="git add --all"
   alias gc="git commit"
   alias gcm="_git_commit_message"
   alias gp="git push"
   alias gl="git pull"
   alias glg="git log"
   alias gd="git diff"
fi

if command -v code > /dev/null 2>&1; then
   alias c="code"
fi

# Docker
function _docker_rm_all() {
   docker rm -f $(docker ps -aq)
}

alias d="docker"
alias drma="_docker_rm_all"

# Docker compose
alias dc="docker compose"
alias dcu="dc up"
alias dcd="dc down"
alias dcufl="dc up -d && dc logs --follow"