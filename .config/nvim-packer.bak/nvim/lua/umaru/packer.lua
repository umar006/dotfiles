local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use("ray-x/lsp_signature.nvim")

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})
	use("nvim-treesitter/playground")

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
	})

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	use("theprimeagen/harpoon")
	use("mbbill/undotree")

	-- Git related plugins
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

	-- Formatter
	use("sbdchd/neoformat")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Colorscheme
	-- use('morhetz/gruvbox')
	use("ellisonleao/gruvbox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- Statusline
	use({ "nvim-lualine/lualine.nvim" })

	-- Icon
	use("kyazdani42/nvim-web-devicons")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
