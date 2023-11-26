-- [[ Configure Colorscheme ]]
function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7aa2f7" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
end

return {
    -- Colorscheme
    { "folke/tokyonight.nvim" },
    { "navarasu/onedark.nvim", opts = {
        style = "darker",
        toggle_style_key = "<leader>ots",
    } },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            styles = {
                conditionals = {},
            },
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
        },
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
        "rose-pine/neovim",
        config = function()
            local transparent = false
            local options = require("rose-pine.config").options
            local blackBg = "base"
            if options.variant ~= "dawn" then
                blackBg = "#000000"
            end
            require("rose-pine").setup({
                disable_background = transparent or false,
                disable_float_background = transparent or false,
                groups = {
                    background = blackBg,
                    panel_nc = blackBg,
                },
                highlight_groups = {
                    Pmenu = { bg = "surface" },
                    LspSignatureActiveParameter = { bg = "pine", fg = "text" },
                    CursorLineNr = { fg = "rose" },
                },
            })
        end,
    },
}
