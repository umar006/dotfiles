return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",

        { "j-hui/fidget.nvim", opts = {}, tag = "legacy" },

        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()
        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            severity_sort = true,
            float = {
                -- 	focusable = true,
                -- style = "minimal",
                -- border = "rounded",
                -- source = "always",
                -- 	header = "",
                -- 	prefix = "",
                -- 	format = function(d)
                -- 		local code = d.code or (d.user_data and d.user_data.lsp.code)
                -- 		if code then
                -- 			return string.format("%s [%s]", d.message, code):gsub("1. ", "")
                -- 		end
                -- 		return d.message
                -- 	end,
            },
        })

        -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        --   focusable = true,
        --   style = "minimal",
        --   border = "rounded",
        -- })

        -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        --   focusable = true,
        --   style = "minimal",
        --   border = "rounded",
        -- })

        local document_hightlight = function(client, bufnr)
            local status_ok, highlight_supported = pcall(function()
                return client.supports_method("textDocument/documentHighlight")
            end)
            if not status_ok or not highlight_supported then
                return
            end
            local group = "lsp_document_highlight"
            local hl_events = { "CursorHold", "CursorHoldI" }

            local ok, hl_autocmds = pcall(vim.api.nvim_get_autocmds, {
                group = group,
                buffer = bufnr,
                event = hl_events,
            })

            if ok and #hl_autocmds > 0 then
                return
            end

            vim.api.nvim_create_augroup(group, { clear = false })
            vim.api.nvim_create_autocmd(hl_events, {
                group = group,
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                group = group,
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        local on_attach = function(client, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
            nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
            nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("<leader>re", require("telescope.builtin").resume, "[R][e]sume")

            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            vim.keymap.set(
                { "i", "n" },
                "<C-k>",
                vim.lsp.buf.signature_help,
                { buffer = bufnr, desc = "Signature Documentation" }
            )

            document_hightlight(client, bufnr)
        end

        local servers = {
            gopls = {
                cmd = { "gopls", "serve" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            },
            tsserver = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            eslint = {},
        }

        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
        })
    end,
}
