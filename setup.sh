#/bin/sh

# Change this variable if the folder is placed in another location
# dotfiles="$HOME/dotfiles"

dotfiles="."
pwd > ~/dotfiles.log

# Set up .config folder with symlink
for folder in "$dotfiles"/config/*; do
        folder=$(basename $folder)
	echo "Loading $folder" >> ~/dotfiles.log

        mkdir -p ~/.config/"$folder"
        ln -s "$dotfiles"/config/"$folder"/* ~/.config/"$folder"/
done

# Setting up scripts folder
ln -s "$dotfiles/scripts" ~/
