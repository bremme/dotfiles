# add custom path extension
PATH=$HOME/.local/bin:$HOME/bin:$HOME/bin/openapitools:/sbin:/usr/games:$PATH

# Add Homebrew to PATH
if [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi