function ColorMyPencils(color)
    color = color or "gruvbox"
    -- vim.cmd.colorscheme("zenwritten")
    vim.cmd.colorscheme("gruvbox")

    -- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
end

return {
    -- Colorscheme
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            on_highlights = function(hl, c)
                hl.NormalFloat = {
                    bg = c.bg_highlight,
                }
            end,
        },
    },
    {
        "maxmx03/solarized.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.o.termguicolors = true
            vim.o.background = "dark"
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local colors = require("gruvbox").palette
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
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },
}
