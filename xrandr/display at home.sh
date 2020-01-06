#!/bin/sh

monitor=$(xrandr | grep DP2 | awk '{print $2}')

if [ $monitor == connected ]
then
    xrandr --output LVDS1 --pos 0x0 --rotate normal --output DP2 --mode 2560x1080 --pos 1280x0 --rotate normal --primary
    xrdb ~/.screenlayout/Xresources
fi
