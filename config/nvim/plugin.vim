if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/dein')
	call dein#begin('~/.config/dein')

	" Plugin Manager
	call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('wsdjeg/dein-ui.vim')

	" Deoplete
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	" Colorschemes
	call dein#add('dracula/vim')
	call dein#add('jacoborus/tender.vim')
	call dein#add('tomasr/molokai')
	call dein#add('morhetz/gruvbox')
	call dein#add('dylanaraps/wal.vim')
	call dein#add('mhartington/oceanic-next')
	call dein#add('drewtempelmeyer/palenight.vim')
	call dein#add('ayu-theme/ayu-vim')
	call dein#add('joshdick/onedark.vim')
	call dein#add('reedes/vim-colors-pencil')
	call dein#add('arcticicestudio/nord-vim')

	" Eye Candy
	call dein#add('ap/vim-css-color')
	call dein#add('ap/vim-buftabline')
	call dein#add('itchyny/lightline.vim')

	" Languages
	call dein#add('vim-scripts/javacomplete')
	call dein#add('davidhalter/jedi.vim')
	call dein#add('Plasticboy/vim-markdown' )
	call dein#add('lervag/vimtex')
	call dein#add('vim-scripts/c.vim')
	call dein#add('stevearc/vim-arduino')
	call dein#add('sirtaj/vim-openscad')
	call dein#add('vim-pandoc/vim-pandoc')
	call dein#add('vim-pandoc/vim-rmarkdown')
	call dein#add('vim-pandoc/vim-pandoc-syntax')

	" Error Checking
	call dein#add('dense-analysis/ale')
	call dein#add('maximbaz/lightline-ale')
	" call dein#add('reedes/vim-wordy')
	" call dein#add('rhysd/vim-grammarous' )

	" Autocomplete
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('deoplete-plugins/deoplete-jedi')
	call dein#add('sirver/ultisnips')
	call dein#add('honza/vim-snippets')
	call dein#add('dkarter/bullets.vim')

	" Clipboard/Undo
	call dein#add('maxbrunsfeld/vim-yankstack')
	call dein#add('mbbill/undotree')
 
	" Tmux
	call dein#add('christoomey/vim-tmux-navigator')

	" Buffers
	call dein#add('majutsushi/tagbar')
	call dein#add('jeetsukumaran/vim-buffergator')
	call dein#add('unblevable/quick-scope')
	call dein#add('mhinz/vim-startify')

	" Limelight/Goyo
	call dein#add('junegunn/goyo.vim')
	call dein#add('junegunn/limelight.vim')

	" Code
	call dein#add('godlygeek/tabular')
	call dein#add('junegunn/vim-easy-align')
	call dein#add('tpope/vim-surround')
	call dein#add('tpope/vim-repeat')
	call dein#add('907th/vim-auto-save')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('tpope/vim-fugitive')
	call dein#add('lilydjwg/fcitx.vim')
	" call dein#add('kevinhwang91/vim-ibus-sw')

	" Folders
	call dein#add('scrooloose/nerdtree')
	" call dein#add('frazrepo/vim-rainbow')

	call dein#end()
	call dein#save_state()
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
let g:ale_enabled = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>

let g:ale_completion_autoimport = 1

" Ale fix
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Ale Completion
" call deoplete#custom#option('sources', {
" \	'_': 'ale',
" \})

" inkscape-figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>

" autopair
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "``":"''", "$":"$", "$$":"$$", "_":"_", "__":"__"}
let g:AutoPairsShortcutToggle = '<>'
let g:AutoPairsMapCh = '<>'

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:updatetime = 500
let g:auto_save_events = ["CursorHold"]

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
let g:lightline = { 'colorscheme': 'gruvbox' }
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

" Tmux Navigator
" inoremap <silent> <C-h> <C-o>:TmuxNavigateLeft<cr>
" inoremap <silent> <C-j> <C-o>:TmuxNavigateDown<cr>
" inoremap <silent> <C-k> <C-o>:TmuxNavigateUp<cr>
" inoremap <silent> <C-l> <C-o>:TmuxNavigateRight<cr>
" inoremap <silent> <C-\> <C-o>:TmuxNavigatePrevious<cr>
