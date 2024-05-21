return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-cmp",

		{ "folke/neodev.nvim", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			local buff_keymap = function(mode, keys, cmd, desc)
				vim.keymap.set(mode, keys, cmd, { buffer = bufnr, desc = desc })
			end

			buff_keymap("n", "<leader>df", vim.diagnostic.open_float, "[d]iagnostics [f]loting window")
			buff_keymap("n", "<leader>dl", vim.diagnostic.setloclist, "[d]iagnostics [l]ist")
			buff_keymap("n", "<leader>d[", vim.diagnostic.goto_prev, "[d]iagnostic previous")
			buff_keymap("n", "<leader>d]", vim.diagnostic.goto_next, "[d]iagnostic next")

			buff_keymap("n", "<leader>gd", vim.lsp.buf.declaration, "[g]o to [d]eclaration")
			buff_keymap("n", "<leader>gD", vim.lsp.buf.definition, "[g]o to [D]efinition")
			buff_keymap("n", "<leader>gt", vim.lsp.buf.type_definition, "[g]o to [t]ype definition")
			buff_keymap("n", "<leader>gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")
			buff_keymap("n", "<leader>gr", vim.lsp.buf.references, "[g]o to [r]eference")

			buff_keymap("n", "<leader>h", vim.lsp.buf.hover, "[h]over")

			buff_keymap("n", "<leader>cr", vim.lsp.buf.rename, "[c]ode [r]ename")
			buff_keymap("n", "<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
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
