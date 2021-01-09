if [ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ] ; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    # add the homeshick/completions directory to the ZSH tab completion lookup path.
    fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
    alias hs="homeshick"
fi