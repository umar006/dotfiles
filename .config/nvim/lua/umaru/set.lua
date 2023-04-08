local set = vim.opt

-- set.path = "**"
-- set.wildignore = {"*.pyc", "*_build/*", "**/coverage/*", "**/node_modules/*", "**/.git/*"}

set.guicursor = ""

set.number = true
set.relativenumber = true
set.cursorline = true

set.completeopt = "menu,menuone,noselect"

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.shiftround = true
set.expandtab = true
set.smartindent = true

set.wrap = false
set.splitright = true

set.swapfile = false
set.backup = false
set.undofile = true

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true

set.scrolloff = 8
set.sidescrolloff = 8
set.signcolumn = "yes"

set.laststatus = 3
set.showtabline = 2
set.cmdheight = 1

set.updatetime = 50

set.colorcolumn = "80"
set.pumheight = 10
set.clipboard = "unnamedplus"

set.foldmethod = "indent"
set.foldenable = false

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
-- 	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
-- 	callback = function()
-- 		vim.opt.foldmethod = "expr"
-- 		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 		vim.opt.foldenable = false
-- 	end,
-- })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
