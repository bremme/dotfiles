
if [ -x /usr/bin/pygmentize ]; then
   alias ccat='pygmentize -g -O style=colorful,linenos=1'
fi

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

alias du-size="du --max-depth=1 --human-readable --one-file-system"
alias du-size-2="du --max-depth=2 --human-readable --one-file-system"
alias du-size-3="du --max-depth=3 --human-readable --one-file-system"

alias c="clear"
alias p="python"

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
#
alias tree="tree -a -I .git"
