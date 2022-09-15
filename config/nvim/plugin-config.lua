-- Undotree
vim.opt.undodir = os.getenv("HOME").."/.undodir"
vim.opt.undofile = true

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
vim.g.UltiSnipsSnippetDirectories = "snip"

-- Autopair
vim.g.AutoPairsShortcutToggle = "<>"
vim.g.AutoPairsMapCh = "<>"

-- Autosave
vim.g.auto_save = 1
vim.g.updatetime = 10
vim.g.auto_save_events = {"CursorHold"}

-- Quickscope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- Yankstack
vim.cmd('call yankstack#setup()')
nmap('Y', 'y$')

-- EasyAlign
map('n', 'ga', '<Plug>(EasyAlign)')
map('x', 'ga', '<Plug>(EasyAlign)')

-- Bullets.vim
vim.g.bullets_enabled_file_types = {'markdown', 'gitcommit', 'scratch', 'rmd'}

-- Tmux Navigator
vim.g.tmux_navigator_save_on_switch = 2
vim.g.tmux_navigator_disable_when_zoomed = 1

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "java", "python" },
  sync_install = false,
  auto_install = true,
  -- ignore_install = { "javascript" },

  highlight = {
    enable = true,
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Airline
vim.cmd("let g:airline#extensions#tabline#enabled = 1")
