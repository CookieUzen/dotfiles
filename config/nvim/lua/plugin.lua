-- Bootstrap packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	-- Colorschemes
	use 'dracula/vim'
	use 'tomasr/molokai'
	use 'morhetz/gruvbox'
	use 'arcticicestudio/nord-vim'
	-- use 'shaunsingh/nord.nvim'
	use 'lilydjwg/colorizer'
	use 'doki-theme/doki-theme-vim'
	
	-- Eye Candy
	-- use 'vim-buftabline'
	-- use 'itchyny/lightline.vim'
	use "folke/twilight.nvim"
	use "folke/zen-mode.nvim"
	use {
		'vim-airline/vim-airline',
		requires = {{'vim-airline/vim-airline-themes'}}
	}
	use 'psliwka/vim-smoothie'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
	-- use 'wellle/context.vim'
	use 'nvim-treesitter/nvim-treesitter-context'
	
	-- Editing
	use 'godlygeek/tabular'
	use 'junegunn/vim-easy-align'
	use '907th/vim-auto-save'
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	use {
		'SirVer/ultisnips',
		requires = {{'honza/vim-snippets'}, {'quangnguyen30192/cmp-nvim-ultisnips'}}
	}
	use 'dkarter/bullets.vim'
	use 'jiangmiao/auto-pairs'

	-- Clipboard
    use {
        'maxbrunsfeld/vim-yankstack',
        run = function() vim.fn['yankstack#setup']() end,
    }
	use 'mbbill/undotree'
	
	-- Tmux
	use 'christoomey/vim-tmux-navigator'

	-- LaTeX
	use 'lervag/vimtex'

	-- Typst
	use {'kaarmu/typst.vim', ft = {'typst'}}

	-- Buffers
	use 'majutsushi/tagbar'
	use 'unblevable/quick-scope'
	use 'mhinz/vim-startify'
	use 'scrooloose/nerdtree'
	use 'jeetsukumaran/vim-buffergator'

	-- LSP + Autocomplete
	use 'neovim/nvim-lspconfig'
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'dmitmel/cmp-cmdline-history'}
		}
	}
	use {
		'hrsh7th/vim-vsnip',
		requires = {
			{'hrsh7th/cmp-vsnip'},
			{'hrsh7th/vim-vsnip-integ'}, 
			{'rafamadriz/friendly-snippets'}, 
		}
	}
	use 'github/copilot.vim'
	use 'jupyter-vim/jupyter-vim'
	use 'goerz/jupytext.vim'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	--	use {'Vigemus/iron.nvim'}
end)
