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

    echo "Installing Homebrew packages..."
    brew bundle install --file="$DOTFILES/brew/Brewfile" --no-lock
else
    echo "Stowing linux..."
    stow --target="$HOME" --dir="$DOTFILES" linux
fi

echo ""
echo "Done."
echo ""
echo "Reminders:"
echo "  - Work machine? Create ~/.gitconfig.local with your work email"
echo "  - macOS? Run 'brew bundle dump --file=$DOTFILES/brew/Brewfile --force' to update Brewfile after installing new apps"
