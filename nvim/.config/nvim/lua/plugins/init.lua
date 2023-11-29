return {
    -- Git related plugins
    "tpope/vim-fugitive",

    "tpope/vim-repeat",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "tpope/vim-sleuth",

    { "theprimeagen/harpoon" },

    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            numhl = true,
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "━" },
                topdelete = { text = "━" },
                changedelete = { text = "∼" },
                untracked = { text = "┇" },
            },
        },
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "auto",
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
            },
        },
    },
}
