require "config.lazy"
require "config.autocmds"
vim.schedule(function()
  require "config.keymaps"
end)
