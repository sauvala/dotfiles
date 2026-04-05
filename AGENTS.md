# Dotfiles — Agent Instructions

## What this repo is

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) on CachyOS Linux.
Files live in `~/dotfiles/` mirroring `$HOME` structure. Stow symlinks them back to their real locations.

## Stack

- **WM:** niri (Wayland, tiling) + Noctalia shell
- **Terminal:** Ghostty
- **Shell:** fish
- **Editor:** micro
- **Browser:** zen-browser
- **Keyboard layouts:** us, fi (toggle with Super+Shift+Space)

## Tracked files

| Path in repo | Symlinked to |
|---|---|
| `.profile` | `~/.profile` |
| `.gitconfig` | `~/.gitconfig` |
| `.config/niri/config.kdl` | niri main config (includes cfg/*.kdl) |
| `.config/niri/cfg/*.kdl` | animation, autostart, display, input, keybinds, layout, misc, rules |
| `.config/ghostty/config` | Ghostty terminal config |
| `.config/fish/config.fish` | Fish shell config |
| `.config/fish/fish_variables` | Fish variables (Pure prompt theme) |
| `.config/micro/settings.json` | Micro editor config |
| `.config/git/ignore` | Global gitignore (applies to all repos) |
| `.config/gtk-3.0/settings.ini` | GTK3 theme |
| `.config/gtk-4.0/settings.ini` | GTK4 theme |

## What must never be committed

- `~/.config/gh/` — GitHub OAuth token
- `~/.config/rclone/` — Google Drive OAuth token
- `~/.config/Bitwarden/` — password manager vault
- `~/.ssh/` — SSH keys
- `~/.gnupg/` — GPG keys
- Any file containing API keys, tokens, or passwords

The `.gitignore` and gitleaks pre-commit hook enforce this.

## How to add a new dotfile

```bash
mv ~/.config/someapp/config ~/dotfiles/.config/someapp/config
cd ~/dotfiles && stow --target=$HOME .
git add .config/someapp/config
git commit -m "track someapp config"
git push
```

## How to remove a dotfile

```bash
cd ~/dotfiles
git rm .config/someapp/config
stow --target=$HOME --restow .
git commit -m "untrack someapp config"
git push
```

## Restore on a new machine

```bash
sudo pacman -S stow git
git clone git@github.com:sauvala/dotfiles.git ~/dotfiles
cd ~/dotfiles && stow --target=$HOME .
```

## Secret scanning

gitleaks runs as a pre-commit hook. If a commit is blocked, check the output for the detected pattern and remove the secret before retrying.
