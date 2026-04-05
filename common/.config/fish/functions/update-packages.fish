function update-packages --description "Regenerate and commit dotfiles package lists"
    set dotfiles $HOME/dotfiles

    if not test -d $dotfiles
        echo "Error: ~/dotfiles not found"
        return 1
    end

    echo "Updating package lists..."
    pacman -Qqen > $dotfiles/linux/packages.txt
    pacman -Qqem > $dotfiles/linux/packages-aur.txt

    echo "Official packages: "(wc -l < $dotfiles/linux/packages.txt)
    echo "AUR packages:      "(wc -l < $dotfiles/linux/packages-aur.txt)

    cd $dotfiles
    git add linux/packages.txt linux/packages-aur.txt
    git commit -m "chore: update package lists"
    git push
    echo "Done."
end
