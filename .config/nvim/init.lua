require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("config.autocmds")

-- [[ Configure Colorscheme ]]
function ColorMyPencils(color, transparent)
	require("catppuccin").setup({
		transparent_background = transparent or false,
	})

	local config = require("gruvbox").config
	local colors = require("gruvbox").palette
	local auto_colors = {
		bg3 = config.contrast == "hard" and colors.dark3 or colors.light3,
	}
	require("gruvbox").setup({
		invert_selection = false,
		contrast = "hard",
		transparent_mode = transparent or false,
		overrides = {
			LspReferenceRead = { fg = colors.neutral_yellow, bg = colors.dark3, bold = true },
			LspReferenceText = { fg = colors.neutral_yellow, bg = colors.dark3, bold = true },
			LspReferenceWrite = { fg = colors.neutral_orange, bg = colors.dark3, bold = true },
		},
	})

	require("rose-pine").setup({
		disable_background = transparent or false,
		disable_float_background = transparent or false,
		highlight_groups = {
			Pmenu = { bg = "surface" },
			LspSignatureActiveParameter = { bg = "pine", fg = "text" },
			CursorLineNr = { fg = "rose" },
		},
	})

	require("tokyonight").setup({
		transparent = transparent or false,
		-- on_highlights = function (hl, colors)
		--   hl.LspSignatureActiveParameter = { bg = colors.blue }
		-- end
	})

	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
end

ColorMyPencils("gruvbox", false)

vim.schedule(function()
	require("config.keymaps")
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
