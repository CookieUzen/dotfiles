set fish_greeting ""

export EDITOR="nvim"

source ~/scripts/alias.sh
source ~/scripts/source.sh

cd (cat ~/.dir)
fish_vi_key_bindings

/opt/shell-color-scripts/colorscript.sh -r 
starship init fish | source
thefuck --alias | source
