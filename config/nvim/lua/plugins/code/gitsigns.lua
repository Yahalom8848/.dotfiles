return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")

		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)

		gitsigns.setup({
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 400,
			},
		})
	end,
}
