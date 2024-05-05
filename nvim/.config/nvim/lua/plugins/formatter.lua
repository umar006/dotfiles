local slow_format_filetypes = {}
local nonels = {
    "nvimtools/none-ls.nvim",
    -- event = { "BufWritePre" },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            if vim.g.disable_autoformat then
                                return
                            end
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end,
}

return {
    -- nonels,
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
            },
            formatters_by_ft = {
                lua = { "stylua" },
                html = { "prettier" },
                css = { "prettier" },
                javascript = { "prettier", "eslint_d" },
                javascriptreact = { "prettierd", "eslint_d" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
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
