" Plugins
source ~/.config/nvim/plugin.vim

" Color
if (has("termguicolors"))
  set termguicolors
endif
" set notermguicolors
"

" Tabstop
set tabstop=4 shiftwidth=4 noexpandtab "expandtab 
" set expandtab

" Syntax
syntax on

" Wrapping with indentation 
set nowrap " do :set wrap to wrap

set breakindent
set formatoptions=l
set lbr

" Terminal Stuff
tnoremap <C-q> <C-\><C-n>

" Quick Insert
nnoremap qo o<Esc>
nnoremap qO ko<Esc>
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

" Spell Fixing
map <F8> [s 1z=

" Spell Files
:setlocal spellfile+=~/.config/nvim/spell/en.utf-8.add
:setlocal spellfile+=.oneoff.utf-8.add

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
" Word count
map <F9> :! texcount "%" <CR>
" map <F10> :! dirname % \| xsel --clipboard --input <CR><CR>

" foldmethod
set foldmethod=syntax

" Buffers
map <Leader>n :bn <CR>
map <Leader>p :bp <CR>

" Neovim Clipboard
set clipboard+=unnamedplus

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Set Shell to Bash
set shell=/bin/bash

" Colorscheme
set background=dark
let g:gruvbox_italic=1
colorscheme nord

" colo palenight
" let g:palenight_terminal_italics=1

" Transparent window
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE

" Better bullet points
imap <C-h> <esc><<A
imap <C-l> <esc>>>A
