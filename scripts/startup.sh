#!/bin/bash
cd ~/scripts

case $DESKTOP_SESSION in
	bspwm)
	# cd golden
	# ./run.sh &
	# cd ..
	# cd bspi
	# ./bspi_listen &
		;;

	i3)
		;;
esac

killall polybar
killall compton 

polybar "$DESKTOP_SESSION"bar &

. ~/.fehbg 

wal -R

xmodmap ~/.Xmodmap

light-locker &
compton --config /home/uzen/.config/compton/compton.conf
