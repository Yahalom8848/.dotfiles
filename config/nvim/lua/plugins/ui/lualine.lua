return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" } } },
				lualine_b = { "filename", "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "filesize", "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { { "location", separator = { right = " " } } },
			},
		})
	end,
}
