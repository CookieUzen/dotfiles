#!/bin/bash

bash "$HOME"/.screenlayout/display.sh

killall picom &

killall polybar &

picom --config /home/uzen/.config/compton/picom.conf &

bash /home/uzen/.fehbg

# xmodmap ~/.Xmodmap

killall unclutter
unclutter -idle 3 -root &

xrdb /home/uzen/.Xresources

sxhkd -c /home/uzen/.config/sxhkd/dwm & 

fcitx &
blueman-applet & 

detach polybar example
