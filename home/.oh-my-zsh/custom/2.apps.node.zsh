# Setup NVM
if [-d "$HOME/.nvm" ]; then
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if

# FNM (faster alternative to NVM)
if [ -d "$HOME/.local/share/fnm" ] ; then
  export PATH="/home/bremme/.local/share/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# Load Angular CLI autocompletion.
if command -v ng >/dev/null 2>&1; then
    source <(ng completion script)
fi
