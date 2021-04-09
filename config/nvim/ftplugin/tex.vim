map <F1> : !latexmk --xelatex "%" <CR>
map <F2> :! zathura "$(echo "%" \| cut -f 1 -d '.').pdf" & <CR><CR>
map <F4> :VimtexTocOpen <CR>
map <F12> :! latexmk "%" <CR>

nnoremap <C-s> :read !grep '@' "citations.bib" \| cut -d'{' -f2 \| sed 's/,//' \| dmenu \| tr -d '\n\r' <CR>
inoremap <C-s> <esc> :!grep '@' "citations.bib" \| cut -d'{' -f2 \| sed 's/,//' \| dmenu <CR>
nnoremap <C-u> <esc> :!bash ~/scripts/csv.sh <CR>

set spell
