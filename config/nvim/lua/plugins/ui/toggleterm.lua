return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		local Terminal = require("toggleterm.terminal").Terminal

		local terminal = Terminal:new({ direction = "float" })
		vim.keymap.set("n", "<leader>ut", function()
			terminal:toggle()
			terminal:change_dir(vim.fn.expand("#:p:h"))
		end, { desc = "[u]i [t]erminal" })

		local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
		vim.keymap.set("n", "<leader>ug", function()
			lazygit:toggle()
		end, { desc = "[u]i [g]it" })
	end,
}
