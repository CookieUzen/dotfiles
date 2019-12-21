#!/bin/bash
cp -n zshrc "$HOME"/ && echo "zshrc install"

if [ "$SHELL" -eq /usr/bin/zsh ]
then
    source "$HOME"/.zshrc
fi
