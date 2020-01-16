map <F1> :! sed 's/$/\n/' "%" | pandoc -o "`echo % | sed 's/.tex//'`.pdf"
set spell
foldopen
color dracula
