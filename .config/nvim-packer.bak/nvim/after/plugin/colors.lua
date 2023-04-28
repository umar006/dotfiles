function ColorMyPencils(color, transparent)
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = transparent or false,
	})

	require("gruvbox").setup({
		invert_selection = true,
		contrast = "hard",
		transparent_mode = transparent or false,
	})

	require("rose-pine").setup({
		dark_variant = "moon",
		disable_background = transparent or false,
		disable_float_background = transparent or false,
		highlight_groups = {
			Pmenu = { bg = "surface" },
			LspSignatureActiveParameter = { bg = "pine", fg = "text" },
			CursorLineNr = { fg = "rose" },
		},
	})

	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
end

ColorMyPencils("rose-pine", false)
