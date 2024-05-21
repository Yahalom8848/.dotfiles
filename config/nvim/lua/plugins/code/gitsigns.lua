return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")

		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[h]unk [p]review" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[h]unk [r]eset" })

		gitsigns.setup({
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 400,
			},
		})
	end,
}
