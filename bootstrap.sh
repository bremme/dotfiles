#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

check_prerequisites() {
  printf "Checking prerequisites...\n"

  local required_packages=("git" "zsh")

  for package in "${required_packages[@]}"; do
    if ! command -v "$package" >/dev/null 2>&1; then
      printf "Error: %s is not installed or not in PATH.\n" "$package" >&2
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

check_prerequisites

# Check if the shell is already set to zsh
if [ -z "${ZSH_VERSION:-}" ]; then
  printf "Warning: Your shell is set to %s, it should be set to zsh for proper functionality.\n" "$SHELL" >&2
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  install_chezmoi
  export PATH="${BIN_DIR}:${PATH}"
fi



# See https://www.chezmoi.io/reference/commands/init/ for more information.
chezmoi --source "$SCRIPT_DIR" --verbose --apply --purge-binary init