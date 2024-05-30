return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter" },
	main = "rainbow-delimiters.setup",
	config = true,
}
