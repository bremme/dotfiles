
if [ -x /usr/local/bin/pygmentize ]; then
   alias ccat='pygmentize -g -O style=colorful,linenos=1'
fi

# chmod
alias chmox='chmod +x'
# grep process
alias proc="ps aux | grep"

# find sbc
alias find-pi="sudo arp-scan --localnet | grep b8:27:eb"
alias find-orangepi="sudo arp-scan --localnet | grep '12:22:1e\|4a:f7:d2\|6e:a5:4d\|0a:af:65'"

# standby disks
alias standby-sda="sudo hdparm -y /dev/sda"
alias standby-sdb="sudo hdparm -y /dev/sdb"
alias standby-sdc="sudo hdparm -y /dev/sdc"

alias c="clear"
alias p="python"

# reload zsh
alias rlz="source ~/.zshrc"

alias hs="homeshick"
