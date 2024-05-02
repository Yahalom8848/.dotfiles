return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		vim.keymap.set("n", "<leader>n", vim.cmd.NullLsInfo)

		null_ls.setup({
			sources = {
			},
		})

		require("mason-null-ls").setup({
			automatic_installation = true,
			handlers = {},
		})
	end
}
