return {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "j-hui/fidget.nvim" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "ts_ls", "omnisharp", "gopls" },
            })

            local function organize_imports()
                local params = {
                    command = "_typescript.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                    title = "",
                }
                Client:exec_cmd(params)
            end

            vim.lsp.enable("ts_ls")
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                commands = {
                    OrganizeImports = {
                        organize_imports,
                        description = "Organize Imports",
                    },
                },
            })

            vim.lsp.enable("omnisharp")
            vim.lsp.config("omnisharp", {
                cmd = { "omnisharp" },
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                    local nmap = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, silent = true })
                    end

                    nmap("gd", require("omnisharp_extended").telescope_lsp_definition, "[G]oto [D]efinition")
                    nmap("gr", require("omnisharp_extended").telescope_lsp_references, "[G]oto [R]eferences")
                    nmap("gi", require("omnisharp_extended").telescope_lsp_implementation, "[G]oto [I]mplementation")
                    nmap("<leader>D", require("omnisharp_extended").telescope_lsp_type_definition, "Type [D]efinition")
                end,
                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true,
                        OrganizeImports = true,
                    },
                    RoslynExtensionsOptions = {
                        EnableAnalyzersSupport = true,
                        EnableImportCompletion = true,
                        AnalyzeOpenDocumentsOnly = true,
                        EnableDecompilationSupport = true,
                    },
                    Sdk = {
                        IncludePrereleases = false,
                    },
                },
            })

            vim.lsp.enable("gopls")
            vim.lsp.config("gopls", {
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

            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
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
    },
}
