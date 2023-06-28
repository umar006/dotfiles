return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = false,
			theme = "auto",
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},
			lualine_x = {},
		},
	},
}
