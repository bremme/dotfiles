#!/bin/bash

# Ensure this script is sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Tip: Run this with 'source ./${BASH_SOURCE[0]##*/}' so functions persist in your shell."
    echo ""
    exit 1
fi

# 1. Get password once via terminal (cross-platform, works bash/zsh/sh)
echo -n "Password: "
read -s PASSWORD
echo

# Check password was provided
if [ -z "$PASSWORD" ]; then
    echo "❌ No password provided. Cancelled."
    return 1
fi

# 2. Verify password works before proceeding (suppress all output)
if ! echo "$PASSWORD" | sudo -S true >/dev/null 2>&1; then
    echo "❌ Invalid password. Cancelled."
    unset PASSWORD
    return 1
fi

# 3. Create temporary askpass script with password inline
ASKPASS_SCRIPT=$(mktemp -t askpass.)
cat > "$ASKPASS_SCRIPT" << EOF
#!/bin/bash
echo "$PASSWORD"
EOF
chmod 700 "$ASKPASS_SCRIPT"

# 4. Clear password from shell memory immediately
unset PASSWORD

# 5. Export environment for sudo
export SUDO_ASKPASS="$ASKPASS_SCRIPT"

# 6. Wrapper for sudo (adds -A flag automatically)
sudo() {
    command sudo -A "$@"
}

# 7. Cleanup function
cleanup() {
    # use `command rm` to bypass any verbose/interactive rm alias
    command rm -f "$ASKPASS_SCRIPT" 2>/dev/null
    unset -f sudo 2>/dev/null
    unset ASKPASS_SCRIPT SUDO_ASKPASS 2>/dev/null
}

# Register cleanup for signals and shell exit.
# NOTE: `trap cleanup EXIT` fires as soon as the *function* it's set in returns
# (zsh-specific), so when sourced via a wrapper function that would delete the
# askpass file immediately. Use a zshexit hook instead, which only fires when
# the shell itself exits.
trap cleanup INT TERM HUP
if [[ -n "$ZSH_VERSION" ]]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook zshexit cleanup
else
    trap cleanup EXIT
fi

echo "✅ Sudo askpass configured! Will automatically fill password for sudo commands."
