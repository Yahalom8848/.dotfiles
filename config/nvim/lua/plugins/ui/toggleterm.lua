return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		local Terminal = require("toggleterm.terminal").Terminal

		vim.keymap.set("n", "<leader>ut", function()
			local terminal = Terminal:new({
				dir = vim.fn.expand("#:h"),
				direction = "float",
			})
			terminal:toggle()
		end, { desc = "[u]i [t]erminal" })

		local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
		vim.keymap.set("n", "<leader>ug", function()
			lazygit:toggle()
		end, { desc = "[u]i [g]it" })
	end,
}
