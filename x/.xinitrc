#!/bin/bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

bash '~/.screenlayout/display at home.sh'
exec i3
