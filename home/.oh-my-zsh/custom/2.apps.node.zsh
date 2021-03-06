
# lazy load nvm, will trigger on first use of nvm, node or npm
load_nvm() {
  unset -f nvm
  unset -f node
  unset -f npm
  unset -f load_nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

nvm() {
  load_nvm
  nvm "$@"
}

node() {
  load_nvm
  node "$@"
}

npm() {
  load_nvm
  npm "$@"
}
