return {
	"echasnovski/mini.surround",
	event = "InsertEnter",
	dependencies = { "which-key.nvim" },
	config = function()
		local mini_surround = require("mini.surround")
		mini_surround.setup({
			mappings = {
				add = "<leader>csa",
				delete = "<leader>csd",
				replace = "<leader>csr",

				highlight = "",
				find = "",
				find_left = "",
				update_n_lines = "",
				suffix_last = "",
				suffix_next = "",
			},
		})

		require("which-key").add({
			{ "<leader>cs", group = "[c]ode [s]urround" },

			{ "<leader>csa", group = "[c]ode [s]urround [a]dd" },
			{ "<leader>csd", group = "[c]ode [s]urround [d]elete" },
			{ "<leader>csr", group = "[c]ode [s]urround [r]eplace" },
		})
	end,
}
