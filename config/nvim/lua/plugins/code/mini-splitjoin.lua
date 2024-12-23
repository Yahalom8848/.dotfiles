return {
	"echasnovski/mini.splitjoin",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mini_splitjoin = require("mini.splitjoin")
		mini_splitjoin.setup({
			mappings = {
				toggle = "",
			},
		})

		vim.keymap.set("n", "<leader>ct", mini_splitjoin.toggle, { desc = "[c]ode [t]oggle spread" })
	end,
}
