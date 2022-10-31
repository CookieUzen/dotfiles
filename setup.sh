#/bin/sh

# Change this variable if the folder is placed in another location
# dotfiles="$HOME/dotfiles"

dotfiles="$(pwd)"

# Set up .config folder with symlink
mkdir -p ~/.config
cd ~/.config
ln -s "$dotfiles"/config/* .

# Setting up scripts folder
ln -s "$dotfiles/scripts" ~/

# Install neovim plugins
pip install neovim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
