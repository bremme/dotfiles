if command -v fastfetch > /dev/null 2>&1; then
  fastfetch
elif command -v neofetch > /dev/null 2>&1; then
  neofetch
fi

# If keychain is installed use it
if command -v keychain > /dev/null 2>&1; then
  eval `keychain --eval --agents ssh id_rsa`
fi
