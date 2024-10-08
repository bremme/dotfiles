# add custom path extension
export PATH=$HOME/.local/bin:$HOME/bin:/sbin:/usr/games:$PATH

if [[ -d "$HOME/AppImage" ]]; then
    export PATH=$HOME/AppImage:$PATH
fi

if [[ -d "$HOME/.krew" ]]; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi


# Add Homebrew to PATH
if [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi