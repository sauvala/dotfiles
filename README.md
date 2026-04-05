# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).
Files live in `~/dotfiles/` and are symlinked into `$HOME` by stow.

## Restore on a new machine

```bash
# 1. Install stow
sudo pacman -S stow   # CachyOS / Arch

# 2. Clone repo
git clone git@github.com:sauvala/dotfiles.git ~/dotfiles

# 3. Stow everything
cd ~/dotfiles && stow --target=$HOME .
```

If stow reports conflicts (existing files at target paths), back them up first:

```bash
cd ~/dotfiles
stow --target=$HOME --simulate . 2>&1 | grep "conflict" | awk '{print $NF}' | while read f
    mkdir -p ~/dotfiles-backup/$(dirname $f)
    mv ~/$f ~/dotfiles-backup/$f
end
stow --target=$HOME .
```

## Day-to-day usage

```bash
# Edit files directly in ~/dotfiles/ — symlinks mean changes are live immediately
micro ~/dotfiles/.config/niri/cfg/keybinds.kdl

# Commit and push changes
cd ~/dotfiles
git add .config/niri/cfg/keybinds.kdl
git commit -m "update keybinds"
git push

# Add a new dotfile
mv ~/.config/someapp/config ~/dotfiles/.config/someapp/config
cd ~/dotfiles && stow --target=$HOME .
git add .config/someapp/config
git commit -m "track someapp config"
git push
```
