return { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                require("treesitter-context").setup({
                    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                    multiwindow = false, -- Enable multiwindow support.
                    max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
                    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                    line_numbers = true,
                    multiline_threshold = 20, -- Maximum number of lines to show for a single context
                    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                    -- Separator between context and content. Should be a single character string, like '-'.
                    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                    separator = nil,
                    zindex = 20, -- The Z-index of the context window
                    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                })
            end,
        },
    },
    build = ":TSUpdate",
    config = function()
        local options = {
            ensure_installed = {
                "go",
                "lua",
                "python",
                "tsx",
                "typescript",
                "javascript",
                "html",
                "css",
                "markdown",
                "markdown_inline",
            },

            auto_install = false,

            highlight = { enable = true },
            indent = { enable = false },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sl"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>sh"] = "@parameter.inner",
                    },
                },
            },
        }

        require("nvim-treesitter.configs").setup(options)
    end,
}
