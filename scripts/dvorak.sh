#!/bin/bash

keymap="$(setxkbmap -print -verbose 10 | grep layout | cut -d":" -f 2 | tr -d ' ')"

if [[ "$keymap" == "us" ]]; then
	setxkbmap dvorak
	xmodmap ~/.Xmodmap
else
	echo hi
	setxkbmap us
	xmodmap ~/.Xmodmap
fi
