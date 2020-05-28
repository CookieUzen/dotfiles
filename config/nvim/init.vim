" Plugins
source ~/.config/nvim/plugin.vim

" Color
let g:gruxbox_italics=1
set background=dark
colo gruvbox

" Tabstop
set tabstop=4 shiftwidth=4 "expandtab

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

" Transparent window
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" hi Normal guibg=NONE ctermbg=NONE


" Spell Fixing
map <F8> [s 1z=

" Spell Files
:setlocal spellfile+=~/.config/nvim/spell/en.utf-8.add
:setlocal spellfile+=.oneoff.utf-8.add

" Numbers
set relativenumber
set nu

" Enable Mouse
set mouse=a

" Macros
map <F9> :! echo `detex "%" \| wc -w ` words <CR>
" map <F10> :! dirname % \| xsel --clipboard --input <CR><CR>
map <F10> : silent exec '! st sh -c "cd $(dirname "%"); zsh" ' <CR>

" termguicolors
if (has("termguicolors"))
  set termguicolors
endif

" foldmethod
set foldmethod=syntax

" Buffers
map <Leader>n :bn <CR>
map <Leader>p :bp <CR>

" Neovim Clipboard
set clipboard+=unnamedplus

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

cmap yeet !pwd > "$HOME"/.dir
cmap yoink !rm "$HOME"/.dir
