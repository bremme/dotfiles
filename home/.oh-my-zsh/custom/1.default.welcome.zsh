if [[ -x /usr/bin/neofetch ]]; then
  neofetch
fi

# If keychain is installed use it
if [[ -x $(which keychain) ]]; then
  eval `keychain --eval --agent ssh id_rsa`
if