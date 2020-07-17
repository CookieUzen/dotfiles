#!/bin/bash

if $(tmux ls > /dev/null); then
	cd $(cat ~/.dir)
	tmux attach-session -t $(cat ~/.tmux) || tmux new -s $(cat ~/.tmux)
else
	tmux new-session -d -s start
	tmux new-session -d -s scratchpad
fi
