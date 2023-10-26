-- [[ Configure Colorscheme ]]
function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
end

return {
	-- Colorscheme
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "catppuccin/nvim" },
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local config = require("gruvbox").config
			local colors = require("gruvbox").palette
			local auto_colors = {
				bg3 = config.contrast == "hard" and colors.dark3 or colors.light3,
			}
			require("gruvbox").setup({
				invert_selection = false,
				contrast = "hard",
				transparent_mode = false,
				overrides = {
					LspReferenceRead = { fg = colors.neutral_yellow, bg = colors.dark3, bold = true },
					LspReferenceText = { fg = colors.neutral_yellow, bg = colors.dark3, bold = true },
					LspReferenceWrite = { fg = colors.neutral_orange, bg = colors.dark3, bold = true },
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		config = function()
			local transparent = false
			require("rose-pine").setup({
				disable_background = transparent or false,
				disable_float_background = transparent or false,
				highlight_groups = {
					Pmenu = { bg = "surface" },
					LspSignatureActiveParameter = { bg = "pine", fg = "text" },
					CursorLineNr = { fg = "rose" },
				},
			})
		end,
	},
}
