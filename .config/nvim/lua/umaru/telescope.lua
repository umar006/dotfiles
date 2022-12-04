local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
telescope.load_extension("fzf")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

telescope.setup({
    defaults = {
		-- -- `hidden = true` is not supported in text grep commands.
		-- -- vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { "node_modules", "dist" }
	},
})
