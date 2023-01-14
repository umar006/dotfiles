-- require("catppuccin").setup({
-- 	flavour = "mocha",
-- 	-- color_overrides = {
-- 	-- 	mocha = {
-- 	-- 		base = "#000000",
-- 	-- 	},
-- 	-- },
-- })

-- require("gruvbox").setup({
-- 	invert_selection = true,
-- 	contrast = "hard",
-- 	-- transparent_mode = true,
-- })

-- vim.cmd.colorscheme("gruvbox")

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })

function ColorMyPencils(color, transparent)
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = transparent or false,
		-- color_overrides = {
		-- 	mocha = {
		-- 		base = "#000000",
		-- 	},
		-- },
	})

	require("gruvbox").setup({
		invert_selection = true,
		contrast = "hard",
		transparent_mode = transparent or false,
	})

	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
end

ColorMyPencils("gruvbox", false)
