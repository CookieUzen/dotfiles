" Plugins
source ~/.config/nvim/plugin.vim

" Color
colo dracula

" Tabstop
set tabstop=4 shiftwidth=4 expandtab

" Syntax
syntax on

" Wrapping with indentation
set breakindent
set formatoptions=l
set lbr

" Terminal Stuff
tnoremap <C-q> <C-\><C-n>

" Quick Insert
nnoremap qo o<Esc>
nnoremap qO O<Esc>

nnoremap <C-i> i_<Esc>r

" Better Scrolling
if !&scrolloff
  set scrolloff=3
endif

" Better Search
set nohlsearch
set showmatch
set ignorecase

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

set mouse=a

let g:AutoPairsShortcutToggle = '<M-q>'

map <F9> :! echo `detex "%" \| wc -w ` words <CR>
map <F10> : silent exec '! termite -d "`pwd`" &' <CR>

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>

set notermguicolors

set foldmethod=syntax
