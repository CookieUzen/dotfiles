#!/bin/bash
killall -URS1 termite
killall polybar

. .fehbg

# polybar top &
# polybar bottom &
polybar i3bar &

wal -R

xmodmap /home/uzen/.Xmodmap

killall compton 
compton --config /home/uzen/.config/compton/compton.conf
