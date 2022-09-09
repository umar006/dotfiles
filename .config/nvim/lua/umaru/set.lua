local set = vim.opt

set.path = "**"
set.wildignore = {"*.pyc", "*_build/*", "**/coverage/*", "**/node_modules/*", "**/.git/*"}

set.guicursor = ""
set.errorbells = false

set.number = true
set.relativenumber = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.shiftround = true
set.expandtab = true
set.smartindent = true

set.wrap = false
set.splitright = true
set.splitbelow = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.sidescrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")

set.laststatus = 3
set.showtabline = 2
-- Give more space for displaying messages.
set.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
set.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
set.shortmess:append("c")

set.colorcolumn = "80"
set.foldmethod = "marker"
set.pumheight = 20
set.clipboard = "unnamedplus"
