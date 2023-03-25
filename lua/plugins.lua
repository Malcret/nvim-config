vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                          , branch = '0.1.x',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

	-- Colorscheme
	use 'Mofiqul/vscode.nvim'

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })	

	-- Undotree
	use 'mbbill/undotree'

    -- Auto Pairs
    use 'jiangmiao/auto-pairs'

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
end)
