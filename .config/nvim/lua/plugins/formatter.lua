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
			typescript = { "prettierd" },
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
}
local formatter = {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},

				javascript = {
					require("formatter.defaults.prettierd"),
				},

				typescript = {
					require("formatter.defaults.prettierd"),
				},

				html = {
					require("formatter.defaults.prettierd"),
				},

				css = {
					require("formatter.defaults.prettierd"),
				},

				json = {
					require("formatter.filetypes.json").jq,
				},

				sh = {
					require("formatter.filetypes.sh").shfmt,
				},

				go = {
					require("formatter.filetypes.go").goimports,
					require("formatter.filetypes.go").gofumpt,
				},

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
return conform
