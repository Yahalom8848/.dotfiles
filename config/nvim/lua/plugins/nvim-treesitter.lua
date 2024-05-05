return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			ignore_install = { "gdshader" }, -- at the time of adding this treesitter is`nt able to install "gdshader"
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
