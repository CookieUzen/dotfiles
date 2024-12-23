-- masno
require("mason").setup()
require("mason-lspconfig").setup()

-- Undotree
vim.opt.undodir = os.getenv("HOME").."/.undodir"
vim.opt.undofile = true

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
vim.g.UltiSnipsSnippetDirectories = {"snip"}

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
	ensure_installed = { "c", "lua", "java", "python", "go" },
	sync_install = false,
	auto_install = true,
	-- ignore_install = { "javascript" },

	highlight = {
		enable = true,
		disable = { "tex", "latex" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Airline
vim.cmd("let g:airline#extensions#tabline#enabled = 1")

-- lspconfig
-- require'lspconfig'.pyright.setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["typst_lsp"] = function ()
		require'lspconfig'.typst_lsp.setup{
			settings = {
				exportPdf = "onSave" -- Choose onType, onSave or never.
		        -- serverPath = "" -- Normally, there is no need to uncomment it.
			}
		}
	end
}


local lspconfig = require('lspconfig')
local servers = { 'pyright' , 'jdtls', 'texlab', 'gopls'}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- require'lspconfig'.typst_lsp.setup{
-- 	settings = {
-- 		exportPdf = "onType" -- Choose onType, onSave or never.
--         -- serverPath = "" -- Normally, there is no need to uncomment it.
-- 	}
-- }

lspconfig['clangd'].setup{
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes"
	},
	on_attach = on_attach,
	capabilities = capabilities,
}

--- nvim-cmp
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "copilot"  },
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'path' },
		{ name = 'buffer' }
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' },
		{ name = 'cmdline_history' }
	})
})

-- Vimtex
vim.g.vimtex_view_method = 'zathura'

-- Copilot
-- vim.g.copilot_node_command = '/home/uzen/.nvm/versions/node/v20.3.1/bin/node'
map('i', '<leader>cp', ':Copilot<CR>')
map('i', '<C-{>', '<Plug>(copilot-previous)')
map('i', '<C-}>', '<Plug>(copilot-next)')

-- Magma
vim.cmd("nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>")
vim.cmd("nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>")
vim.cmd("xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>")
vim.cmd("nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>")
vim.cmd("nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>")
vim.cmd("nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>")

vim.g.magma_automatically_open_output = 'v:false'

-- Jupytext
vim.g.jupytext_fmt = 'py:percent'

-- TODO:
-- show keybindings plugin
-- copilot.lua

-- copilot-cmp.lua
-- copilotchat
