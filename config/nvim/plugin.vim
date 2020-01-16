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
Plugin 'dylanaraps/wal.vim'

" Plugins
Plugin 'javacomplete'
" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'Plasticboy/vim-markdown' 
Plugin 'rhysd/vim-grammarous' 
" Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'c.vim'
" Plugin 'stevearc/vim-arduino'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
" Plugin 'davidhalter/jedi-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'lervag/vimtex'
" Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'reedes/vim-wordy'
" Plugin 'reedes/vim-lexical'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-system-copy'
" Plugin 'gorodinskiy/vim-coloresque'
Plugin 'maxbrunsfeld/vim-yankstack'
" Plugin 'sirtaj/vim-openscad'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-repeat'
call vundle#end()
filetype plugin indent on
" supertab
" let g:SuperTabDefaultCompletionType = "<c-x>"
" let g:SuperTabMappingFoward = '<c-n>'
" let g:SuperTabMappingBackward = '<c-p>'

" javacomplete2
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" let g:JavaComplete_EnableDefaultMappings = 0

" javacomplete
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif


" undotree
if has("persistent_undo")
    set undodir=$HOME/.undodir"
    set undofile
endif

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" let g:tex_conceal=""
let g:tex_conceal='abdmg'

" Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<tab>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=["snip"]

" Limelight & Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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
" let g:indentLine_color_term = 5
" let g:indentLine_char_list = ['|']
" let g:indentLine_conceallevel = 1
set conceallevel=2

" Deoplete
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})

" Ale
let g:airline#extensions#ale#enabled = 1
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>
