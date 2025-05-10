-- [[ Setting options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- -- Set completeopt to have a better completion experience
-- opt.completeopt = "menu,menuone,noselect"

opt.tabstop = 2
opt.shiftwidth = 2
-- opt.softtabstop = 2
opt.expandtab = true
opt.shiftround = true
opt.smartindent = true
opt.autoindent = true

opt.wrap = false
opt.splitright = true
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"

-- opt.swapfile = false
-- opt.backup = false
opt.undofile = true
-- opt.undolevels = 10000

-- opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 4
opt.sidescrolloff = 8
opt.signcolumn = "yes"

opt.laststatus = 3
opt.showtabline = 2

-- -- Decrease update time
opt.updatetime = 50
opt.timeoutlen = 300

opt.colorcolumn = "80"
opt.pumheight = 10
opt.clipboard = "unnamedplus"

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Options from lazyvim
-- opt.autowrite = true -- Enable auto write
-- opt.conceallevel = 3 -- Hide * markup for bold and italic
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.list = false -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
-- opt.pumblend = 10 -- Popup blend
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
-- opt.spelllang = { "en" }
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width

-- opt.smoothscroll = true
