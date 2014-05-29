
# dircolors
DIRCOLORS="$HOME/.dircolors.monokai.echelon"
# DIRCOLORS="$HOME/.dircolors.monokai.jtheoof"
# enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r $DIRCOLORS && eval "$(dircolors -b $DIRCOLORS)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CF'

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

# git 
alias st='status'

# got to directory
alias gtrapp='cd /usr/share/appliactions'
alias gtapp='cd ~/.local/share/applications'

# sublime text
alias st='/home/bremme/bin/sublime'
alias v='vim'

# sudo commands
alias snano='sudo nano'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -x /usr/bin/pygmentize ]; then
	alias cat='pygmentize -g'
else
  echo "pygmentize not installed, using regular cat"
fi

