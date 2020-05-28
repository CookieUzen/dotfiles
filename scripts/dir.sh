#!/bin/bash

__ScriptVersion="version 1.0.0"

function usage () {
	echo "HELP!"
}

# getopts
while getopts "h" option
do
	case "${option}"
	in
	h) usage
		;;
	* )  echo -e "\n  Option does not exist : $OPTARG\n";
		usage; exit 1
		;;
	esac
done
shift $(($OPTIND-1))

for i in "$@"; do
	case $i in
		set) pwd > "$HOME"/.dir
			;;
		unset) rm "$HOME"/.dir
			;;
	esac
done
