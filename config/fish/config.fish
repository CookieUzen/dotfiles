set fish_greeting ""

export EDITOR="nvim"

source ~/scripts/alias.sh
source ~/scripts/source.sh

cd (cat ~/.dir)
fish_vi_key_bindings

/opt/shell-color-scripts/colorscript.sh -r 
<<<<<<< HEAD
thefuck --alias | source
=======

starship init fish | source
>>>>>>> 1e63f998cc9a5158a5f6892178d6a5fce4733508
