#!/bin/bash

udr=1;        # Universal Update Rate for status bar, in seconds
delimeter="|" # Seletive Delimeter

function day () {
	icon=""
	text="$(date +"%B %_d")"

	echo "$icon $text"
}

function time () {
	icon=""
	text="$(date +"%H:%M")"

	echo "$icon $text"
}

function cmus () {
	if [[ $(cmus-remote -C) ]]; then
		stat="NA"
		echo hi
	else
		stat=`cmus-remote -C status | grep status | sed 's/status //'`
		artist=`cmus-remote -C status | grep "tag artist" | sed 's/tag artist //'`
		title=`cmus-remote -C status | grep "tag title" | sed 's/tag title //'`
	fi

	case $stat in
		stopped)
			icon=  
			;;
		paused)
			icon=  
			;;
		playing)
			icon=  
			;;
	esac

	case $stat in
		playing)
			echo "$icon" "$title"
			;;
		NA)
			echo "Not open"
			;;
		*)
			echo "$icon"
			;;
	esac
}

function battery () {
	percentage="$(acpi | cut -d',' -f 2 | sed 's/ //g' | sed 's/%//g')"

	if [[ $percentage -gt 90 ]]; then
		icon=""
	elif [[ $percentage -gt 70 ]]; then
		icon=""
	elif [[ $percentage -gt 40 ]]; then
		icon=""
	elif [[ $percentage -gt 30 ]]; then
		icon=""
	fi

	# Detect if charging
	[[ $(acpi | cut -d',' -f 3) -eq "" ]] && icon=""

	echo $icon $percentage\%
}

function connection () {
	# Replace wlp62s0 with your wifi module
	text="$(iw dev wlp62s0 link | head -n 2 | tail -n 1 | cut -d' ' -f 2)"
	
	[[ "$text" == "connected." ]] && text="Disconnected"

	icon=""

	echo "$icon $text"
}

function volume () {
	volume="$(amixer get Master | tail -n 1 | cut -d'[' -f 2 | sed 's/%] //')"

	if [[ $volume -gt 50 ]]; then
		icon=""
	elif [[ $volume -gt 0 ]]; then
		icon=""
	fi

	[[ $(amixer get Master | tail -n 1 | cut -d'[' -f 3 | sed 's/]//') == "off" ]] && volume="muted"; icon=""

	echo "$icon $volume"
}

while true; 
do
	widgets=($(declare -F | sed 's/declare -f //'))

	for i in "${widgets[@]}"
	do
		statusbar+="`$i` $delimeter "
	done

	# echo "$statusbar"
	xsetroot -name "$statusbar"
	
	statusbar=""

	sleep $udr
done
