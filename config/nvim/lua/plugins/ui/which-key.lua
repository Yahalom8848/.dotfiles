return {
	"folke/which-key.nvim",
	config = function()
		local which_key = require("which-key")
		which_key.setup()

		which_key.add({
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>d", group = "[d]iagnostics" },
			{ "<leader>f", group = "[f]ind" },
			{ "<leader>g", group = "[g]o to / [g]it" },
		})
	end,
}
