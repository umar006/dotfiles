return {
    -- Git related plugins
    "tpope/vim-fugitive",

    -- Text manipulation plugins
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    -- {
    --     "tpope/vim-commentary",
    --     dependencies = {
    --         "JoosepAlviste/nvim-ts-context-commentstring",
    --     },
    -- },
    { "tpope/vim-sleuth" },

    { "ThePrimeagen/git-worktree.nvim" },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

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
                delete = { text = "┃" },
                topdelete = { text = "┃" },
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
            tabline = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 2,
                    },
                },
            },
        },
    },

    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     config = function(_, opts)
    --         require("lsp_signature").setup(opts)
    --     end,
    -- },

    {
        "numToStr/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                dimensions = {
                    height = 0.6,
                    width = 0.6,
                },
            })

            -- Example keybindings
            vim.keymap.set({ "n", "i" }, "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
            vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
        end,
    },

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
            enable_autocmd = false,
        },
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
}
