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
            vim.diagnostic.config({
                virtual_text = true,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
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
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if
                                vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                            then
                                return
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = "LuaJIT",
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        "${3rd}/luv/library",
                                    },
                                },
                            })
                        end,
                        settings = {
                            Lua = {},
                        },
                    })
                end,
            })
        end,
    },
}
