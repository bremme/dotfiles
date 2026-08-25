export PYTHONBREAKPOINT=ipdb.set_trace

if command -v uv > /dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

if command -v ty > /dev/null 2>&1; then
  eval "$(ty generate-shell-completion zsh)"
fi