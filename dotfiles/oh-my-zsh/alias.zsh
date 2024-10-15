function _du_depth() {
   # du --human-readable --one-file-system --total --max-depth $1 "$2" | sort --reverse --human-numeric-sort
   du -hxcd $1 "$2" | sort -rh
}

function _docker_rm_all() {
   docker rm -f $(docker ps -aq)
}

if command -v code > /dev/null 2>&1; then
   alias c="code"
fi

# chmod
alias chmox='chmod +x'

# grep process
alias proc="ps aux | grep -i"
# Grep from alias
alias grepa="alias | grep -i"
# Grep from env
alias grepe="env | grep -i"
alias grepp="ps aux | grep -i"

# find sbc
alias find-pi="sudo arp-scan --localnet | grep b8:27:eb"
alias find-orangepi="sudo arp-scan --localnet | grep '12:22:1e\|4a:f7:d2\|6e:a5:4d\|0a:af:65\|02:81:b4'"

# standby disks
alias standby-sda="sudo hdparm -y /dev/sda"
alias standby-sdb="sudo hdparm -y /dev/sdb"
alias standby-sdc="sudo hdparm -y /dev/sdc"
alias standby-sdd="sudo hdparm -y /dev/sdd"
alias standby-sde="sudo hdparm -y /dev/sde"
alias standby-sdf="sudo hdparm -y /dev/sdf"
alias standby-sdg="sudo hdparm -y /dev/sdg"

alias du1="_du_depth 1"
alias du2="_du_depth 2"
alias du3="_du_depth 3"

# docker
alias doc="docker"
alias drma="_docker_rm_all"

# docker compose  
if command -v docker-compose > /dev/null 2>&1; then
   alias dc="docker-compose"
else
   alias dc="docker compose"
fi

alias dcu="dc up"
alias dcd="dc down"
alias dcufl="dc up -d && dc logs --follow"


# reload zsh
alias rlz="source ~/.zshrc"

# set good defaults for cp
alias cp="cp --interactive --recursive --archive --verbose"
# set good defaults for rm
alias rm="rm --recursive --interactive=once --verbose"
# set good defaults for mkdir
alias mkdir="mkdir --parents --verbose"
# set good defaults for mv
alias mv="mv --interactive --verbose"
# set good defaults for tree
alias tree="tree -a -I .git"

# rust alternatives
if command -v exa > /dev/null 2>&1; then
   exa_common_args="--group --group-directories-first --icons"

   alias l="exa -l $exa_common_args"
   alias la="exa -la $exa_common_args"
   alias ls="exa $exa_common_args"

   exa_tree_args="--tree"
   alias lt="exa $exa_tree_args $exa_common_args"
   alias lt2="exa $exa_tree_args $exa_common_args --level=2"
   alias lt3="exa $exa_tree_args $exa_common_args --level=3"
fi

if command -v batcat > /dev/null 2>&1; then
   alias cat=batcat --paging=never
elif command -v bat > /dev/null 2>&1; then
   alias cat=bat --paging=never
fi

if command -v fdfind > /dev/null 2>&1; then
   alias fd=fdfind
   alias f=fdfind
elif command -v fd > /dev/null 2>&1; then
   alias f=fd
fi

alias whatsmyip="curl ifconfig.me"

alias please='sudo $(fc -ln -1)'

alias rtfm="man"

# Git alias
alias gst="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit --m"
alias gp="git push"
alias gl="git pull"
alias glg="git log"
