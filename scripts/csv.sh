#!/bin/bash

# sed 's/@article/article = /;s/@book/ book = /;s/@online/web = /' citations.bib 

search="$(grep '@' "citations.bib" | cut -d'{' -f2 | sed 's/,//' | dmenu)" 

qutebrowser $(grep -A 8 $search citations.bib | grep url | sed 's/{//;s/}//;s/\t//g;s/url//;s/=//;s/ //g;s/,//')  &
