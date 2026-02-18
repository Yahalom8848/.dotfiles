return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function() end,
			on_highlights = function() end,
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
