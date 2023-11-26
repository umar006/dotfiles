-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Toggle autoformat
vim.api.nvim_create_user_command("ToggleAutoFormat", function()
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat then
        return print("Auto format disable")
    end
    return print("Auto format enable")
end, {
    desc = "Toggle autoformat-on-save",
})
