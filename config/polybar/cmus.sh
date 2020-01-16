#!/bin/bash
status=`cmus-remote -C status | grep status | sed 's/status //'`
artist=`cmus-remote -C status | grep "tag artist" | sed 's/tag artist //'`
title=`cmus-remote -C status | grep "tag title" | sed 's/tag title //'`

case $status in
    stopped)
        statSymb=  
        ;;
    paused)
        statSymb=  
        ;;
    playing)
        statSymb=  
        ;;
esac

case $status in
    stopped)
    echo $statSymb
        ;;
    paused)
        ;;
    playing)
    echo "$statSymb" "$title"
        ;;
esac
