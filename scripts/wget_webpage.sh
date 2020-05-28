#!/bin/bash

# [[ ! "$1" ]] && echo Requires input; exit 1

domain="$( echo "$1" | sed 's/https:\/\///;s/http:\/\///'| cut -d'/' -f1 )"


wget --recursive --domains "$domain" --no-parent --page-requisites --html-extension --convert-links --restrict-file-names=windows --no-clobber "$1"  

echo done.
