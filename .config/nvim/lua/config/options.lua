-- [[ Setting options ]]
-- See `:help vim.o`
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
set.shiftround = true
set.expandtab = true
set.smartindent = true

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

