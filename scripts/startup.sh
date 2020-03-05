#!/bin/bash

killall polybar &
killall compton &

wal -R
polybar bspwmbar &
compton --config /home/uzen/.config/compton/compton.conf &
