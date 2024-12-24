return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "which-key.nvim" },
	config = function()
		local gitsigns = require("gitsigns")

		require("which-key").add({ "<leader>gh", group = "[g]it [h]unk" })
		vim.keymap.set("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "[g]it [h]unk [p]review" })
		vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "[g]it [h]unk [r]eset" })

		gitsigns.setup({
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 400,
			},
		})
	end,
}
