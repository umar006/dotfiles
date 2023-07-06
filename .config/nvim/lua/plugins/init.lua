return {
	-- Git related plugins
	"tpope/vim-fugitive",

	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

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
}
