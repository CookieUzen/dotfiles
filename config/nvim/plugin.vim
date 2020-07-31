" Vundle
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
" Bundle 'sonph/onehalf', {'rtp' : 'vim/'}
Plugin 'dracula/vim' 
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'dylanaraps/wal.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'arcticicestudio/nord-vim'

" Eye Candy
Plugin 'ap/vim-css-color'
Plugin 'ap/vim-buftabline'
Plugin 'itchyny/lightline.vim'

" Languages
Plugin 'javacomplete'
Plugin 'davidhalter/jedi-vim'
Plugin 'Plasticboy/vim-markdown' 
Plugin 'lervag/vimtex'
Plugin 'c.vim'
Plugin 'stevearc/vim-arduino'
Plugin 'sirtaj/vim-openscad'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Error Checking
" Plugin 'rhysd/vim-grammarous' 
Plugin 'dense-analysis/ale'
Plugin 'maximbaz/lightline-ale'
" Plugin 'reedes/vim-wordy'

" Autocomplete
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/deoplete.nvim'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dkarter/bullets.vim'

" Clipboard/Undo
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'mbbill/undotree'
 
" Tmux
" Bundle 'christoomey/vim-tmux-navigator'

" Buffers
Plugin 'majutsushi/tagbar'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'unblevable/quick-scope'
Plugin 'mhinz/vim-startify'

" Limelight/Goyo
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Code
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin '907th/vim-auto-save'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Folders
Plugin 'scrooloose/nerdtree'
Plugin 'frazrepo/vim-rainbow'

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
" let g:deoplete#enable_smart_case = 1
"call deoplete#custom#var('omni', 'input_patterns', {
"        \ 'tex': g:vimtex#re#deoplete
"        \})
"inoremap <silent><expr> <C-n>
"\ pumvisible() ? "\<C-SPACE>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#mappings#manual_complete()

" Ale
" let g:airline#extensions#ale#enabled = 1
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

" Palenight
let g:palenight_terminal_italics=1

" Airline
" let g:airline_theme='simple'

" Lightline-Ale
" Register the components:
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" Set color to the components:
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" Lightline
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

let g:lightline = {
      \ 'active': {
      \  'right': [	[ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
      \ },
\ }

" Quickscope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Yankstack
call yankstack#setup()
nmap Y y$

" Vim Rainbow
let g:rainbow_active = 1

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'gitcommit',
    \ 'scratch',
	\ 'rmd'
    \]

" Arduino
autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{MyStatusLine()}'
