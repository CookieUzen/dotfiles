set fish_greeting ""

export EDITOR="nvim"

source ~/scripts/alias.sh
source ~/scripts/source.sh

cd (cat ~/.dir)
fish_vi_key_bindings

# /opt/shell-color-scripts/colorscript.sh -r 
starship init fish | source
# thefuck --alias | source

fish_add_path ~/.gem/ruby/3.0.0/bin ~/go/bin ~/.cargo/bin ~/.gem/ruby/2.7.0/bin ~/.local/bin ~/.bin
