return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
            {
                "williamboman/mason.nvim",
                cmd = { "Mason" },
                opts = {},
            },
            { "williamboman/mason-lspconfig.nvim", opts = {} },
        },
        config = function()
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
                -- document_hightlight(client, bufnr)
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = { "gopls", "tsserver", "lua_ls", "eslint", "cssls", "html" },
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,

                ["tsserver"] = function()
                    local function organize_imports()
                        local params = {
                            command = "_typescript.organizeImports",
                            arguments = { vim.api.nvim_buf_get_name(0) },
                            title = "",
                        }
                        vim.lsp.buf.execute_command(params)
                    end

                    local lspconfig = require("lspconfig")
                    lspconfig.tsserver.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        commands = {
                            OrganizeImports = {
                                organize_imports,
                                description = "Organize Imports",
                            },
                        },
                    })
                end,

                ["gopls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        cmd = { "gopls", "serve" },
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                analyses = {
                                    unusedparams = true,
                                },
                            },
                        },
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if
                                not vim.loop.fs_stat(path .. "/.luarc.json")
                                and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
                            then
                                client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
                                    Lua = {
                                        diagnostics = {
                                            globals = { "vim" },
                                        },
                                        runtime = {
                                            version = "LuaJIT",
                                        },
                                        workspace = {
                                            checkThirdParty = false,
                                            library = {
                                                vim.env.VIMRUNTIME,
                                            },
                                        },
                                    },
                                })

                                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                            end
                            return true
                        end,
                    })
                end,
            })
        end,
    },
}
