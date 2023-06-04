-- [[ Setting options ]]
local set = vim.opt

set.guicursor = ""

set.number = true
set.relativenumber = true
set.cursorline = true

-- Set completeopt to have a better completion experience
set.completeopt = "menuone,noselect"

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.shiftround = true
set.smartindent = true
set.autoindent = true

set.wrap = false
set.splitright = true

set.swapfile = false
set.backup = false
set.undofile = true

set.hlsearch = false
set.ignorecase = true
set.smartcase = true

set.termguicolors = true

set.scrolloff = 8
set.sidescrolloff = 8
set.signcolumn = "yes"

set.laststatus = 3
set.showtabline = 2
set.cmdheight = 1

-- Decrease update time
set.updatetime = 50
set.timeout = true
set.timeoutlen = 300

set.colorcolumn = "80"
set.pumheight = 10
set.clipboard = "unnamedplus"

set.foldmethod = "indent"
set.foldenable = false

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<F10>", ":set hlsearch!<cr>")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>vv", ":Ex<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>vq", vim.diagnostic.setloclist)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

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

require("lazy").setup({
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

	{ import = "plugins" },
}, {})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Configure Colorscheme ]]
function ColorMyPencils(color, transparent)
	require("catppuccin").setup({
		-- flavour = "mocha",
		transparent_background = transparent or false,
	})

  local config = require("gruvbox").config
  local colors = require("gruvbox.palette").get_base_colors(vim.o.background, config.contrast)
	require("gruvbox").setup({
		invert_selection = true,
		contrast = "hard",
		transparent_mode = transparent or false,
    overrides = {
      LspReferenceRead = { fg = colors.yellow, bg = "#403d52", bold = true },
      LspReferenceText = { fg = colors.yellow, bg = "#403d52", bold = true },
      LspReferenceWrite = { fg = colors.orange, bg = "#403d52", bold = true },
    }
	})

	require("rose-pine").setup({
		-- dark_variant = "main",
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
