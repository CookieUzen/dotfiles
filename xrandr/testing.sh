#!/bin/sh

monitor=$(xrandr | grep DP2 | awk '{print $2}')

if [ $monitor == connected ]
then
    xrandr --output LVDS1 --mode 1280x800 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --primary --mode 1280x720 --pos 1280x0 --rotate normal --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output VGA1 --off --output VIRTUAL1 --off
fi

