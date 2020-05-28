#!/bin/bash

bash "$HOME"/.screenlayout/display.sh

killall compton &

compton --config /home/uzen/.config/compton/compton.conf &

bash /home/uzen/.fehbg

killall unclutter
unclutter -idle 3 -root &

rm -rf /home/uzen/anywhere/*

xrdb /home/uzen/.Xresources

dwmbar &

sxhkd -c /home/uzen/.config/sxhkd/dwm
