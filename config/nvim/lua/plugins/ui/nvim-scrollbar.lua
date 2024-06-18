return {
	"petertriho/nvim-scrollbar",
	dependencies = { "gitsigns.nvim" },
	config = function()
		require("scrollbar").setup()
		require("scrollbar.handlers.gitsigns").setup()
	end,
}
