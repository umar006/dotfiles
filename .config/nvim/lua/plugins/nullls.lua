return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		-- [[ Configure Null-ls ]]
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
