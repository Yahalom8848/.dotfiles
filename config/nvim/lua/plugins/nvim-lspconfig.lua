return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				vim.keymap.set("n", "gd", vim.lsp.buf.declaration)
				vim.keymap.set("n", "gD", vim.lsp.buf.definition)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
				vim.keymap.set("n", "gr", vim.lsp.buf.references)

				vim.keymap.set("n", "K", vim.lsp.buf.hover)

				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

				vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
			end
		})

		local language_servers = {
		}
	
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(language_servers),
			handlers = {
				function(name)
					lspconfig[name].setup({
						settings = language_servers[name],
						capabilities = capabilities,
					})
				end,
			}
		})
	end,
}
