return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		vim.keymap.set("n", "<leader>n", vim.cmd.NullLsInfo, { desc = "[n]ull-ls" })

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.selene,
				null_ls.builtins.formatting.stylua,
			},
		})

		require("mason-null-ls").setup({
			automatic_installation = true,
			handlers = {},
		})
	end,
}
