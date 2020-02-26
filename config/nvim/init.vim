" Plugins
source ~/.config/nvim/plugin.vim

" Color
colo wal

" Tabstop
set tabstop=4 shiftwidth=4 "expandtab

" Syntax
syntax on

" Wrapping with indentation
set nowrap

set breakindent
set formatoptions=l
set lbr

" Terminal Stuff
tnoremap <C-q> <C-\><C-n>

" Quick Insert
nnoremap qo o<Esc>
nnoremap qO O<Esc>
nnoremap <C-i> i_<Esc>r

" Quick deleting
nnoremap dD 0D

" Better Scrolling
if !&scrolloff
  set scrolloff=3
endif

" Better Search
set nohlsearch
set showmatch
set ignorecase

" Conceal level
set conceallevel=2

" Latex
map <F2> :! zathura "$(echo "%" \| cut -f 1 -d '.').pdf" & <CR><CR>

" Source init.vim
map <F3> :so ~/.config/nvim/init.vim <CR>

" Quick Spell Checking
" setlocal spell
set spelllang=en_us

" Goyo toggling
map <F4> :!gnuplot % <CR>

" Transparent window
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Spell Fixing
map <F8> [s 1z=

" Spell Files
:setlocal spellfile+=~/.config/nvim/spell/en.utf-8.add
:setlocal spellfile+=oneoff.utf-8.add

" Numbers
set relativenumber
set nu

" Easy Scrolling
" map J gj
" map K gk
" map H b
" map L w

" Enable Mouse
set mouse=a

" Macros
map <F9> :! echo `detex "%" \| wc -w ` words <CR>
" map <F10> :! dirname % \| xsel --clipboard --input <CR><CR>
map <F10> : silent exec '! st sh -c "cd $(dirname "%"); zsh" ' <CR>
" map <F10> : ! st sh -c 'echo $(pwd); zsh' 

" termguicolors
set notermguicolors

" foldmethod
set foldmethod=syntax

" auto compiling
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!bash ~/.surf/surf-open.sh % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'md'
exec "!bash ~/scripts/md.sh &"
endif
endfunc
