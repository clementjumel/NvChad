local overrides = require("custom.configs.overrides")

local plugins = {

	-- Configuration overrides for NvChad default plugins
	-- See ~/.config/nvim/lua/plugins/init.lua for NvChad plugins definition
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},

	-- Custom plugins

	-- Meta
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	-- File navigation
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("custom.configs.oil")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- File edition
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("custom.configs.todo-comments")
		end,
		lazy = false,
	},
	{
		"phaazon/hop.nvim",
		opts = function()
			return require("custom.configs.hop")
		end,
	},
	{
		"github/copilot.vim",
		lazy = false,
	},

	-- LSP
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {
			"json",
			"lua",
			"markdown",
			"python",
			"yaml",
		},
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		cmd = { "Git" },
		config = function()
			require("custom.configs.fugitive")
		end,
	},
}

return plugins
