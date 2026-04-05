#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
OS=$(uname)

echo "Dotfiles: $DOTFILES"
echo "OS: $OS"

# Install stow if needed
if ! command -v stow &>/dev/null; then
    echo "Installing stow..."
    if [ "$OS" = "Darwin" ]; then
        brew install stow
    else
        sudo pacman -S stow --noconfirm
    fi
fi

# Stow common configs (all machines)
echo "Stowing common..."
stow --target="$HOME" --dir="$DOTFILES" common

# Stow OS-specific configs
if [ "$OS" = "Darwin" ]; then
    echo "Stowing macos..."
    stow --target="$HOME" --dir="$DOTFILES" macos
else
    echo "Stowing linux..."
    stow --target="$HOME" --dir="$DOTFILES" linux
fi

echo "Done. If this is a work machine, create ~/.gitconfig.local with your work email:"
echo '  [user]'
echo '      email = you@company.com'
