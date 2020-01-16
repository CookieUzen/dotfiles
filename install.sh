#/bin/bash

# Change this variable if the folder is placed in another location
dotfiles="$HOME/dotfiles"

# Set up .config folder with symlink
cd ~/.config
ln -s "$dotfiles/config/*" .

# Set up surf with symlink
mkdir "$HOME"/.surf 
cd "$HOME/.surf/"
ln -s "$dotfiles/surf/*" .

# Setting up zsh
echo Assuming OhMyZsh is installed
cd ~
ln -s "$dotfiles/zsh/zshrc" .zshrc

# Setting up scripts folder
cd ~
ln -s "$dotfiles/scripts" .
