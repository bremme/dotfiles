#!/usr/bin/env sh
set -eu

REPO="${DOTFILES_REPO:-}"
BIN_DIR="${HOME}/.local/bin"

# if [ -z "$REPO" ]; then
#   printf "Error: set DOTFILES_REPO (e.g. DOTFILES_REPO=youruser)\n" >&2
#   exit 1
# fi


install_chezmoi() {

  mkdir -p "$BIN_DIR"

  if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$BIN_DIR"
  elif command -v wget >/dev/null 2>&1; then
    sh -c "$(wget -qO- get.chezmoi.io)" -- -b "$BIN_DIR"
  else
    printf "Error: need curl or wget to install chezmoi.\n" >&2
    exit 1
  fi

}

add_binary_to_path() {
  # Add BIN_DIR to PATH for this session so 'chezmoi init' can run immediately.
  # Future shells still rely on your shell config (.bashrc, .zshrc, etc.) to include it.
  case ":${PATH}:" in
    *":${BIN_DIR}:"*) 
      ;;
    *)
      export PATH="${BIN_DIR}:${PATH}"
      printf "Note: added %s to PATH for this session. Ensure it is in your shell config.\n" "$BIN_DIR"
      ;;
  esac
}

if ! command -v chezmoi >/dev/null 2>&1; then
  install_chezmoi
  add_binary_to_path
fi

# See https://www.chezmoi.io/reference/commands/init/ for more information.

chezmoi --source . -v init
# chezmoi init "$REPO"

printf "Initialized chezmoi for %s. Run 'chezmoi diff' to review, then 'chezmoi apply'.\n" "$REPO"

