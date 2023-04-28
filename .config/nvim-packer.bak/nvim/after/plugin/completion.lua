local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup {}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				luasnip = "[LuaSnip]",
				path = "[Path]",
			},
		}),
	},
	sources = cmp.config.sources({
		-- { name = "nvim_lsp" },
		{ name = "nvim_lsp",               max_item_count = 30, keyword_length = 3 },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})
