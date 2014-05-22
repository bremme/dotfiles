# start node server
alias startnodesrv='VBoxManage startvm "Turnkey Node.js Weezy"'

# color cat
# alias ccat='pygmentize -g'

# get wan ip
alias wanip='curl ipecho.net/plain ; echo'

# get lan ip
alias lanip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# pulse audio sources
alias pasource="pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d' ' -f2"
# pulse audio sinks
alias pasink="pactl list | grep -A2 'Sink #' | grep 'Name: ' | cut -d' ' -f2"

# reload bash
alias rlb='source ~/.bashrc'

# grep process
alias proc='ps aux | grep'

# apt-get
alias agi='sudo apt-get install'
alias agis='sudo apt-get install -s'
alias agr='sudo apt-get remove'
alias agp='sudo apt-get purge'


# got to directory
alias gtrapp='cd /usr/share/appliactions'
alias gtapp='cd ~/.local/share/applications'

# sublime text
alias st='/home/bremme/bin/sublime'

# sudo commands
alias snano='sudo nano'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -x /usr/bin/pygmentize ]; then
	alias cat='pygmentize -g'
	echo "pygmentize"
else
	echo "nono"
fi

