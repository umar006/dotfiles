vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>vv", "<cmd>Oil<CR>")

--- @param next boolean
--- @param severity? vim.diagnostic.SeverityFilter
local diagnostic_goto = function(next, severity)
  print(severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  --- @type vim.diagnostic.JumpOpts
  local goOps = next and { count = 1, float = true, severity = severity }
    or { count = -1, float = true, severity = severity }
  return function()
    vim.diagnostic.jump(goOps)
  end
end

-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(true, "WARN"), { desc = "Prev Warning" })
