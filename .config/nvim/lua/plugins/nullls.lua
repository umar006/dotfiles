return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local lsp_formatting = function(bufnr)
			local filetype = vim.bo.filetype
			local n = require("null-ls")
			local s = require("null-ls.sources")
			local method = n.methods.FORMATTING
			local available_formatters = s.get_available(filetype, method)

			vim.lsp.buf.format({
				filter = function(client)
					if #available_formatters > 0 then
						return client.name == "null-ls"
					else
						return true
					end
				end,
				bufnr = bufnr,
			})
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							local file_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
							if not string.find(file_path, "siklus/backyard/routes") then
								lsp_formatting(bufnr)
							end
						end,
					})
				end
			end,
		})
	end,
}
