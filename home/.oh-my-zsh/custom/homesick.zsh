if [ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ] ; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
    alias hs="homeshick"
    alias dotfiles="homeshick cd dotfiles"
fi