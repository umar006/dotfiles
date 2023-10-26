-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- local formatter_group = vim.api.nvim_create_augroup("LspFormatting", {})
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = formatter_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		-- local file_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
-- 		-- if not string.find(file_path, "siklus/backyard/routes") then
-- 		-- end
-- 		local defined_types = require("formatter.config").values.filetype
-- 		if defined_types[vim.bo.filetype] ~= nil then
-- 			vim.cmd([[FormatWrite]])
-- 		else
-- 			vim.lsp.buf.format()
-- 		end
-- 	end,
-- })

vim.api.nvim_create_user_command("FormatDisable", function(args)
	vim.g.disable_autoformat = true
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
