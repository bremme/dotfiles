# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# load zsh_command_not_found if present
[ -f /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found


if command -v oc > /dev/null 2>&1; then
    source <(oc completion zsh)
fi

if command -v kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
fi