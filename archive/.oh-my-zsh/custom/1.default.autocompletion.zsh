if command -v oc > /dev/null 2>&1; then
    source <(oc completion zsh)
fi

if command -v kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

if command -v pipx > /dev/null 2>&1; then
    eval "$(register-python-argcomplete pipx)"
fi