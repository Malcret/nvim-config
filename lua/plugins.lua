vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                          , branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- Telescope file browser
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		}
	}

	-- Which Key
	use 'folke/which-key.nvim'

	-- Colorscheme
	use 'Mofiqul/vscode.nvim'

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	}

	-- Toggleterm
	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
	}

	-- Undotree
	use 'mbbill/undotree'

	-- Auto Pairs
	use 'jiangmiao/auto-pairs'

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		}
	}

	-- Bufferline
	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons',
	}

	-- Vista
	use 'liuchengxu/vista.vim'

	-- LSP Zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- DAP
	use {
		"jay-babu/mason-nvim-dap.nvim",
		requires = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		}
	}
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		}
	}

	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}

	-- Codeium
	use 'Exafunction/codeium.vim'

	-- Dashboard
	use {
		'glepnir/dashboard-nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}

end)