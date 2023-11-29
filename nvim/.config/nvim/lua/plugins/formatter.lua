local conform = {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            html = { "prettierd" },
            css = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            go = { "goimports", "gofumpt" },
            json = { "jq" },
            sh = { "shfmt" },
            ["_"] = { "trim_whitespace" },
        },
        format_on_save = function()
            if vim.g.disable_autoformat then
                return
            end

            --             local toOrganizeImport = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
            --             local ft = vim.bo.filetype
            --             for _, v in ipairs(toOrganizeImport) do
            --                 if v == ft then
            --                     vim.cmd("OrganizeImport")
            --                 end
            --             end

            return { timeout_ms = 500, lsp_fallback = true }
        end,
    },
}

return conform
