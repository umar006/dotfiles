require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",

                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "logiPat",
                "man",
                "matchit",
                "matchparen",
                "remote_plugins",
                "rplugin",
                "rrhelper",
                "shada_plugin",
                "spec",
                "spellfile_plugin",
                "tar",
                "tutor_mode_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "netrwFileHandlers",
                "netrwSettings",

                "tagbar",
                "ctags",
                "quickfix",
            },
        },
    },
})

require("config.autocmds")

ColorMyPencils("gruvbox")

vim.schedule(function()
    require("config.keymaps")
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
