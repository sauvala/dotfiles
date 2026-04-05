# Dotfiles — Agent Instructions

## What this repo is

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) on CachyOS Linux, personal MacBook, and work MacBook.
Files live in `~/dotfiles/` organized into stow packages and are symlinked into `$HOME`.

## Stack

- **WM:** niri (Wayland, tiling) + Noctalia shell (Linux)
- **Terminal:** Ghostty
- **Shell:** fish
- **Editor:** Emacs
- **Browser:** zen-browser
- **Keyboard layouts:** us, fi (toggle with Super+Shift+Space) — Linux only

## Package structure

| Package | Stowed on | Contents |
|---------|-----------|----------|
| `common/` | all machines | Emacs, fish, ghostty, git, micro, .profile, .claude |
| `linux/` | CachyOS | niri, gtk-3.0, gtk-4.0 |
| `macos/` | macOS | alacritty, iterm2, Terminal |

## Package management

- Use `paru` or `sudo pacman` for package installs — never `yay`

## Install on a new machine

```bash
# 1. Install stow and git
sudo pacman -S stow git   # CachyOS
brew install stow git     # macOS

# 2. Clone repo
git clone git@github.com:sauvala/dotfiles.git ~/dotfiles

# 3. Run install script (detects OS automatically)
bash ~/dotfiles/install.sh
```

If stow reports conflicts, back up the conflicting files first:
```bash
mv ~/.config/someapp/config ~/.config/someapp/config.bak
bash ~/dotfiles/install.sh
```

## Work machine git identity

Create `~/.gitconfig.local` (not tracked) with your work email:

```gitconfig
[user]
    email = janne@workcompany.com
```

## What must never be committed

- `~/.config/gh/` — GitHub OAuth token
- `~/.config/rclone/` — Google Drive OAuth token
- `~/.config/Bitwarden/` — password manager vault
- `~/.ssh/` — SSH keys
- `~/.gnupg/` — GPG keys
- `~/.gitconfig.local` — machine-specific git identity
- Any file containing API keys, tokens, or passwords

The `.gitignore` and gitleaks pre-commit hook enforce this.

## Day-to-day usage

```bash
# Edit files directly — symlinks mean changes are live immediately
# Example:
emacs ~/dotfiles/linux/.config/niri/cfg/keybinds.kdl

# Commit and push
cd ~/dotfiles
git add linux/.config/niri/cfg/keybinds.kdl
git commit -m "update keybinds"
git push
```

## Add a new dotfile

```bash
# Decide which package it belongs to: common, linux, or macos
mv ~/.config/someapp/config ~/dotfiles/common/.config/someapp/config
cd ~/dotfiles && stow --target=$HOME --dir=. common
git add common/.config/someapp/config
git commit -m "track someapp config"
git push
```

## Remove a dotfile

```bash
cd ~/dotfiles
git rm common/.config/someapp/config
stow --target=$HOME --dir=. --restow common
git commit -m "untrack someapp config"
git push
```

## Secret scanning

gitleaks runs as a pre-commit hook. If a commit is blocked, check the output for the detected pattern and remove the secret before retrying.
