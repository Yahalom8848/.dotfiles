return {
	"brenton-leighton/multiple-cursors.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("multiple-cursors").setup()

		vim.keymap.set({ "n", "v", "i" }, "<C-M-k>", vim.cmd.MultipleCursorsAddUp, { desc = "Add cursor up" })
		vim.keymap.set({ "n", "v", "i" }, "<C-M-j>", vim.cmd.MultipleCursorsAddDown, { desc = "Add cursor down" })

		vim.keymap.set(
			{ "n", "v", "i" },
			"<C-M-LeftMouse>",
			vim.cmd.MultipleCursorsMouseAddDelete,
			{ desc = "Toggle cursor" }
		)
	end,
}
