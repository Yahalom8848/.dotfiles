return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
		vim.keymap.set("n", "<leader>gu", function()
			lazygit:toggle()
		end, { desc = "[g]it [u]i" })
	end,
}
