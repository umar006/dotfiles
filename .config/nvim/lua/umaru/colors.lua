vim.g.umaru_colorscheme = "catppuccin"

vim.o.background="dark"

vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_colors = {
    bg_float = "none"
}

-- Catpuccin
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup{
    transparent_background = true,
}

require("kanagawa").setup{
    transparent = true,
}

vim.cmd("colorscheme " .. vim.g.umaru_colorscheme)

-- vim.cmd[[highlight Normal guibg=none]]
vim.cmd[[highlight SignColumn guibg=none]]
vim.cmd[[highlight LineNr guifg=#7aa2f7]]
vim.cmd[[highlight VertSplit guifg=#7aa2f7]]

