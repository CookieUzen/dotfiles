set nocompatible
filetype off
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Color
Bundle 'sonph/onehalf', {'rtp' : 'vim/'}
Plugin 'dracula/vim' 
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-one'
Plugin 'agude/vim-eldar'
Plugin 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'dylanaraps/wal.vim'


" Plugins
Plugin 'Plasticboy/vim-markdown' 
Plugin 'rhysd/vim-grammarous' 
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'c.vim'
Plugin 'stevearc/vim-arduino'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/dictionary.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Bundle 'matze/vim-tex-fold'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-lexical'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-system-copy'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'sirtaj/vim-openscad'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
call vundle#end()
filetype plugin indent on
" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabMappingFoward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" undotree
if has("persistent_undo")
    set undodir=$HOME/.undodir"
    set undofile
endif

" Deoplete
call deoplete#enable()
" inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal=""

" Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<C-y>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<C-p>'
let g:UltiSnipsSnippetDirectories=["snip"]

" Limelight & Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!<F3>

" Limelight
inoremap <c-g> <c-g>u<Esc>[s1z=`]a<c-g>u

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Indentline
let g:indentLine_color_term = 5
let g:indentLine_char_list = ['|']
let g:indentLine_conceallevel = 1
set conceallevel=0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['', 'text/language_check']

" Vim Hardtime
let g:hardtime_default_on = 0

" Texcount
"  au BufWritePost <buffer> redraw | echo WrittenString() . ' | ' . WordCount()

  function! WrittenString()
      return '"' . expand('%:h:t') . '/' . expand('%:t') .
          \ '" ' . line('$') . ' lines written'
  endfunction

  function! WordCount()
      return substitute(system('texcount -1 -sum '
          \ . expand('%')), '[^0-9]', '', 'g') . ' words'
  endfunction

" Deoplete
let g:deoplete#enable_smart_case = 1
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd FileType java JCEnable

