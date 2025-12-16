return {
  -- Git related plugins
  "tpope/vim-fugitive",

  -- Text manipulation plugins
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      -- signs = {
      --   add = { text = "┃" },
      --   change = { text = "┃" },
      --   delete = { text = "┃" },
      --   topdelete = { text = "┃" },
      --   changedelete = { text = "∼" },
      --   untracked = { text = "┇" },
      -- },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"

      -- REQUIRED
      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<leader>e", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<A-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<A-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<A-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<A-4>", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<A-5>", function()
        harpoon:list():select(5)
      end)
      vim.keymap.set("n", "<A-6>", function()
        harpoon:list():select(6)
      end)
      vim.keymap.set("n", "<A-7>", function()
        harpoon:list():select(7)
      end)
      vim.keymap.set("n", "<A-8>", function()
        harpoon:list():select(8)
      end)
      vim.keymap.set("n", "<A-9>", function()
        harpoon:list():select(9)
      end)
      vim.keymap.set("n", "<A-0>", function()
        harpoon:list():select(0)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-h>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-l>", function()
        harpoon:list():next()
      end)
    end,
  },
}
