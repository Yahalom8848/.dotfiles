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
			local buff_keymap = function(mode, keys, cmd, opts)
				opts.buffer = bufnr
				vim.keymap.set(mode, keys, cmd, opts)
			end

			buff_keymap("n", "<leader>df", vim.diagnostic.open_float, { desc = "[d]iagnostics [f]loting window" })
			buff_keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[d]iagnostics [l]ist" })
			buff_keymap("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[d]iagnostic [p]revious" })
			buff_keymap("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[d]iagnostic [n]ext" })

			buff_keymap("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[g]o to [d]eclaration" })
			buff_keymap("n", "<leader>gD", vim.lsp.buf.definition, { desc = "[g]o to [D]efinition" })
			buff_keymap("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "[g]o to [t]ype definition" })
			buff_keymap("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[g]o to [i]mplementation" })
			buff_keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "[g]o to [r]eference" })

			buff_keymap("n", "<leader>h", vim.lsp.buf.hover, { desc = "[h]over", nowait = true })

			buff_keymap("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[c]ode [r]ename" })
			buff_keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
			buff_keymap("n", "<leader>ch", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
			end, { desc = "[c]ode [h]int" })

			buff_keymap({ "n", "v" }, "<leader>cc", "gc", { desc = "[c]ode [c]omment", remap = true })
			buff_keymap({ "n", "v" }, "<leader>ccl", "gcc", { desc = "[c]ode [c]omment [l]ine", remap = true })

			vim.api.nvim_create_autocmd("BufWritePre", {
				desc = "Format buffer before write",
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end

		local language_servers = {
			lua_ls = {},
			clangd = {},
			cmake = {},
			rust_analyzer = {
				["rust-analyzer"] = {
					cargo = {
						features = "all",
					},
					check = {
						command = "clippy",
					},
				},
			},
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
