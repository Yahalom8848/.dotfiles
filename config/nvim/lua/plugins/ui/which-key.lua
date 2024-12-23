return {
	"folke/which-key.nvim",
	config = function()
		local which_key = require("which-key")
		which_key.setup()

		which_key.register({
			c = { name = "[c]ode", _ = "which_key_ignore" },
			cs = { name = "[c]ode [s]urround", _ = "which_key_ignore" },
			d = { name = "[d]iagnostics", _ = "which_key_ignore" },
			f = { name = "[f]ind", _ = "which_key_ignore" },
			g = { name = "[g]o to", _ = "which_key_ignore" },
			gh = { name = "[g]it [h]unk", _ = "which_key_ignore" },
		}, { prefix = "<leader>" })
	end,
}
