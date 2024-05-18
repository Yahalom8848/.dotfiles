return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			local buff_keymap = function(mode, keys, cmd, desc)
				vim.keymap.set(mode, keys, cmd, { buffer = bufnr, desc = desc })
			end

			buff_keymap("n", "<leader>df", vim.diagnostic.open_float)
			buff_keymap("n", "<leader>dl", vim.diagnostic.setloclist)
			buff_keymap("n", "[d", vim.diagnostic.goto_prev)
			buff_keymap("n", "]d", vim.diagnostic.goto_next)

			buff_keymap("n", "<leader>gd", vim.lsp.buf.declaration)
			buff_keymap("n", "<leader>gD", vim.lsp.buf.definition)
			buff_keymap("n", "<leader>gt", vim.lsp.buf.type_definition)
			buff_keymap("n", "<leader>gi", vim.lsp.buf.implementation)
			buff_keymap("n", "<leader>gr", vim.lsp.buf.references)

			buff_keymap("n", "<leader>h", vim.lsp.buf.hover)

			buff_keymap("n", "<leader>cr", vim.lsp.buf.rename)
			buff_keymap("n", "<leader>ca", vim.lsp.buf.code_action)

			buff_keymap("n", "<leader>s", function()
				vim.lsp.buf.format()
				vim.cmd.w()
			end)
		end

		local language_servers = {
			lua_ls = {},
		}

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(language_servers),
			handlers = {
				function(name)
					lspconfig[name].setup({
						settings = language_servers[name],
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			},
		})
	end,
}
