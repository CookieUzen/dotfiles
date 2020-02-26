#!/bin/bash
dir="$(ls --group-directories-first /home/uzen/.config | dmenu)"
if [ "$dir" = "autostart" ]
then
    echo Empty Folder
else
    nvim /home/uzen/.config/"$dir"/*
fi


