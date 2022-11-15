if command -v pygmentize > /dev/null 2>&1; then
   # STYLE="colorful"
   STYLE="solarized-dark"
   alias ccat='pygmentize -g -O style=$STYLE,linenos=1'
fi

if command -v code > /dev/null 2>&1; then
   alias c="code"
fi

# if command -v oc > /dev/null 2>&1; then
#    # Use separate OpenShift configuration
#    alias oc="oc --kubeconfig ~/.kube/config.oc"
# fi

# if command -v tkn > /dev/null 2>&1; then
#    # Use separate OpenShift configuration
#    alias tkn="tkn --kubeconfig ~/.kube/config.oc"
# fi

function _du_depth() {
   # du --human-readable --one-file-system --total --max-depth $1 "$2" | sort --reverse --human-numeric-sort
   du -hxcd $1 "$2" | sort -rh
}

# chmod
alias chmox='chmod +x'
# grep process
alias proc="ps aux | grep"

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

# docker compose
if command -v docker-compose > /dev/null 2>&1; then
   alias dc="docker-compose"
   alias dcu="docker-compose up"
   alias dcd="docker-compose down"
else
   alias dc="docker compose"
   alias dcu="docker compose up"
   alias dcd="docker compose down"
fi


# reload zsh
alias rlz="source ~/.zshrc"

# set good defaults for cp
alias cp="cp --interactive --recursive --archive"
# set good defaults for rm
alias rm="rm --recursive --interactive=once"
# set good defaults for mkdir
alias mkdir="mkdir --parents --verbose"
# set good defaults for mv
alias mv="mv --interactive --verbose"
# set good defaults for tree
alias tree="tree -a -I .git"

# Grep from alias
alias grepa="alias | grep -i"
# Grep from env
alias grepe="env | grep -i"

alias whatsmyip="curl ifconfig.me"