return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = { 
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",

		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
				
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}),
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm(),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end
			},
			formatting = {
				format = require("lspkind").cmp_format(), 
			}
		})	
	end
}
