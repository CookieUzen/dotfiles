" Vundle
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
Bundle 'sonph/onehalf', {'rtp' : 'vim/'}
Plugin 'dracula/vim' 
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'dylanaraps/wal.vim'

" Languages
Plugin 'javacomplete'
Plugin 'davidhalter/jedi-vim'
Plugin 'Plasticboy/vim-markdown' 
Plugin 'lervag/vimtex'
Plugin 'c.vim'

" Error Checking
Plugin 'rhysd/vim-grammarous' 
Plugin 'dense-analysis/ale'
Plugin 'reedes/vim-wordy'

" Autocomplete
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" Clipboard/Undo
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'mbbill/undotree'

" Tmux
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-system-copy'

" buffers
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'jeetsukumaran/vim-buffergator'

" Start menu
Plugin 'mhinz/vim-startify'

" Limelight/Goyo
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Code
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin '907th/vim-auto-save'

" Filetypes
Plugin 'sirtaj/vim-openscad'

" Folders
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" omnifuncs
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


" undotree
if has("persistent_undo")
    set undodir=$HOME/.undodir"
    set undofile
endif

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

let g:vimtex_imaps_leader = ';'

" Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetDirectories=["snip"]

" Limelight & Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_priority = -1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})

" Ale
let g:airline#extensions#ale#enabled = 1
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>

" inkscape-figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>

" autopair
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "``":"''"}
let g:AutoPairsShortcutToggle = '<>'

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

