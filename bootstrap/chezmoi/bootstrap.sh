#!/usr/bin/env bash
set -euo pipefail

REPO="${DOTFILES_REPO:-}"
BIN_DIR="${HOME}/.local/bin"

# if [ -z "$REPO" ]; then
#   printf "Error: set DOTFILES_REPO (e.g. DOTFILES_REPO=youruser)\n" >&2
#   exit 1
# fi


check_prerequisites() {
  printf "Checking prerequisites...\n"
  # curl or wget is required for installing chezmoi
  # check if git, zsh and curl or wget are installed
  local prereqs=("git" "zsh")
  for prereq in "${prereqs[@]}"; do
    if ! command -v "$prereq" >/dev/null 2>&1; then
      printf "Error: %s is not installed or not in PATH.\n" "$prereq" >&2
      exit 1
    fi
  done

  if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    printf "Error: curl or wget is required but not installed.\n" >&2
    exit 1
  fi

}

install_chezmoi() {

  mkdir -p "$BIN_DIR"

  if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$BIN_DIR"
  else
    sh -c "$(wget -qO- get.chezmoi.io)" -- -b "$BIN_DIR"
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
      ;;
  esac
}


check_prerequisites

# Check if the shell is already set to zsh
if [ -z "${ZSH_VERSION:-}" ]; then
  printf "Warning: Your shell is set to %s, it should be set to zsh for proper functionality.\n" "$SHELL" >&2
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  install_chezmoi
  add_binary_to_path
fi

# See https://www.chezmoi.io/reference/commands/init/ for more information.

# NOTE this only works if running from the root of the dotfiles repository
chezmoi --source . --verbose init --apply --purge-binary
# chezmoi init "$REPO"

printf 'Please update your PATH first:\n\n\t\texport PATH=%s:$PATH\n\n' "$BIN_DIR"
printf "Initialized chezmoi for %s. Run 'chezmoi diff' to review, then 'chezmoi apply'.\n" "$REPO"

