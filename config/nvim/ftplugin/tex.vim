" Latex key bindings
map <F1> : !latexmk --xelatex "%" <CR>
map <F2> :! zathura "$(echo "%" \| cut -f 1 -d '.').pdf" & <CR><CR>
map <F4> :VimtexTocOpen <CR>
map <F12> :! latexmk "%" <CR>

" latex surrond
let g:surround_{char2nr("`")} = "`\r'"

set spell
