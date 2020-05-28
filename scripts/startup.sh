#!/bin/bash

# bash "$HOME"/.screenlayout/display.sh

killall compton &

sh $HOME/.config/polybar/launch.sh
compton --config /home/uzen/.config/compton/compton.conf &

bash /home/uzen/.fehbg

# xmodmap ~/.Xmodmap

killall unclutter
unclutter -idle 3 -root &

rm -rf /home/uzen/anywhere/*

xrdb /home/uzen/.Xresources

sxhkd -c /home/uzen/.config/sxhkd/dwm
