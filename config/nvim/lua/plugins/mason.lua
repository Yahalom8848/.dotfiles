return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>m", vim.cmd.Mason)

		require("mason").setup()
	end
}
