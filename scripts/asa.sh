#!/bin/bash
dir="$(cd /home/uzen/vf/Class/asa; ls -d * | dmenu -i)"

if [ -z "$dir" ]
then
    echo Empty Folder!
else
    cd /home/uzen/vf/Class/asa/"$dir"
fi
