return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-cmp",
	},
	config = function()
		require("lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local buff_keymap = function(mode, keys, cmd, opts)
					opts.buffer = event.buf
					vim.keymap.set(mode, keys, cmd, opts)
				end

				buff_keymap("n", "<leader>df", vim.diagnostic.open_float, { desc = "[d]iagnostics [f]loting window" })
				buff_keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[d]iagnostics [l]ist" })
				buff_keymap("n", "<leader>dp", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { desc = "[d]iagnostic [p]revious" })
				buff_keymap("n", "<leader>dn", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { desc = "[d]iagnostic [n]ext" })

				buff_keymap("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[g]o to [d]eclaration" })
				buff_keymap("n", "<leader>gD", vim.lsp.buf.definition, { desc = "[g]o to [D]efinition" })
				buff_keymap("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "[g]o to [t]ype definition" })
				buff_keymap("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[g]o to [i]mplementation" })
				buff_keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "[g]o to [r]eference" })

				buff_keymap("n", "<leader>h", vim.lsp.buf.hover, { desc = "[h]over", nowait = true })

				buff_keymap("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[c]ode [r]ename" })
				buff_keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
				buff_keymap("n", "<leader>ch", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, { desc = "[c]ode [h]int" })

				buff_keymap({ "n", "v" }, "<leader>cc", "gc", { desc = "[c]ode [c]omment", remap = true })
				buff_keymap({ "n", "v" }, "<leader>ccl", "gcc", { desc = "[c]ode [c]omment [l]ine", remap = true })

				vim.api.nvim_create_autocmd("BufWritePre", {
					desc = "Format buffer before write",
					buffer = event.buf,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end,
		})

		require("mason-lspconfig").setup({
			automatic_enable = true,
			ensure_installed = {
				"lua_ls",
				"clangd",
				"cmake",
				"rust_analyzer",
				"pylsp",
				"csharp_ls",
				"ts_ls",
				"docker_language_server",
			},
		})

		vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })

		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						features = "all",
					},
					check = {
						command = "clippy",
					},
				},
			},
		})
	end,
}
