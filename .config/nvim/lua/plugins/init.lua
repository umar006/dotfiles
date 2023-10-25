return {
	-- Git related plugins
	"tpope/vim-fugitive",

	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-sleuth",

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	"theprimeagen/harpoon",

	"folke/zen-mode.nvim",
	{
		"folke/twilight.nvim",
		config = function()
			require("zen-mode").setup({
				plugins = {
					tmux = { enabled = true },
				},
			})
		end,
	},

	-- Colorscheme
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000, config = true },
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "catppuccin/nvim" },
	{ "rose-pine/neovim" },
	"arcticicestudio/nord-vim",

	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {},
			},
		},
	},
}
