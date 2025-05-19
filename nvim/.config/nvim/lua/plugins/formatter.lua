return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters = {
                eslint_d = function()
                    local util = require("conform.util")

                    return {
                        prepend_args = { "--cache" },
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
                csharpier = {
                    command = "csharpier",
                    args = { "format", "--write-stdout" },
                },
                ["biome-check"] = {
                    require_cwd = true,
                },
                ["biome-organize-imports"] = {
                    require_cwd = true,
                },
            },
            formatters_by_ft = {
                cs = { "csharpier" },
                lua = { "stylua" },
                html = { "prettier", "prettierd" },
                css = { "prettier" },
                javascript = { "biome-check", "biome-organize-imports", "prettierd", stop_after_first = true },
                javascriptreact = {
                    "biome-check",
                    "biome-organize-imports",
                    "prettierd",
                    stop_after_first = true,
                },
                typescript = { "biome-check", "biome-organize-imports", "prettierd", stop_after_first = true },
                typescriptreact = {
                    "biome-check",
                    "biome-organize-imports",
                    "prettierd",
                    stop_after_first = true,
                },
                go = { "goimports", "gofumpt" },
                json = { "jq" },
                sh = { "shfmt" },
                yaml = { "prettierd" },
            },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat then
                    return
                end

                return { timeout_ms = 10000, lsp_fallback = true }
            end,
            log_level = vim.log.levels.DEBUG,
        },
    },
}
