return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[f]ind [r]esume" })
		vim.keymap.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, { desc = "[f]ind [i]n this file" })

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
		vim.keymap.set("n", "<leader>fI", builtin.live_grep, { desc = "[f]ind [I]n all files" })

		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[f]ind [o]ld files" })

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[f]ind [c]ommands" })

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
