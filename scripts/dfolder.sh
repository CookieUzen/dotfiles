#!/bin/bash
dir="$(cd /home/uzen/vf/Class; ls -d * | dmenu -i)"

if [ -z "$dir" ]
then
    echo Empty Folder!
else
    cd /home/uzen/vf/Class/"$dir"
fi
