return {
	"echasnovski/mini.surround",
	event = "InsertEnter",
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
	end,
}
