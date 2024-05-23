-- Mapping 
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Packer
require('plugin')
require('plugin-config')

-- Colorscheme
vim.cmd("colorscheme nord")

-- Syntax
vim.opt.syntax = "on"

-- Indent
vim.cmd("filetype plugin indent on")

-- Source init
nmap('<F3>', ':so ~/.config/nvim/init.lua<CR>')

-- Truecolor
vim.opt.termguicolors = true

-- Tabstop
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

-- Wrap
vim.opt.wrap = false

-- Scrolling
vim.opt.scrolloff = 3

-- Search
-- vim.opt.hlsearch = false
vim.opt.ignorecase = true

-- Conceal level (replace text with symbols)
vim.opt.conceallevel = 2

-- Spellchecking
vim.opt.spelllang = "en_us"
nmap("<F8>", "[s 1z=")

-- Enable Mouse
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Clipboard
-- vim.opt.clipboard = "unnamedplus"

-- Transparent Background
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")

-- Easier Indenting
-- imap('<C-h>', '<C-O> <<')
-- imap('<C-l>', '<C-O> <<')

-- Buffer Management
vim.opt.hidden = true
