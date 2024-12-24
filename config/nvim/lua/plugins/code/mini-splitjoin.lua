return {
	"echasnovski/mini.splitjoin",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "which-key.nvim" },
	config = function()
		require("mini.splitjoin").setup({
			mappings = {
				toggle = "<leader>ct",
			},
		})

		require("which-key").add({ "<leader>ct", group = "[c]ode [t]oggle spread" })
	end,
}
