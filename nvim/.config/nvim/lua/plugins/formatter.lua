return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters = {
                biome = function()
                    local util = require("conform.util")

                    return {
                        require_cwd = true,
                        cwd = util.root_file({
                            "biome.json",
                        }),
                        args = {
                            "check",
                            "--apply-unsafe",
                            "--formatter-enabled=true",
                            "--organize-imports-enabled=true",
                            "--skip-errors",
                            "--stdin-file-path",
                            "$FILENAME",
                        },
                    }
                end,
                eslint_d = function()
                    local util = require("conform.util")

                    return {
                        require_cwd = true,
                        cwd = util.root_file({
                            -- https://eslint.org/docs/latest/user-guide/configuring/configuration-files-new
                            "eslint.config.js",
                            -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
                            ".eslintrc",
                            ".eslintrc.js",
                            ".eslintrc.cjs",
                            ".eslintrc.yaml",
                            ".eslintrc.yml",
                            ".eslintrc.json",
                        }),
                    }
                end,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                html = { "prettierd" },
                css = { "prettierd" },
                javascript = { { "biome", "eslint_d", "prettierd" } },
                javascriptreact = { { "biome", "eslint_d", "prettierd" } },
                typescript = { { "biome", "eslint_d", "prettierd" } },
                typescriptreact = { { "biome", "eslint_d", "prettierd" } },
                go = { "goimports", "gofumpt" },
                json = { "jq" },
                sh = { "shfmt" },
                ["_"] = { "trim_whitespace" },
            },
            format_on_save = function()
                if vim.g.disable_autoformat then
                    return
                end

                return { timeout_ms = 500, lsp_fallback = true }
            end,
        },
    },
}
