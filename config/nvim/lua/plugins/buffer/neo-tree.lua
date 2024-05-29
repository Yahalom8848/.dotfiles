return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				name = {
					trailing_slash = true,
				},
			},
			window = {
				width = 38,
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "disabled",
			},
		})

		vim.cmd.Neotree("show")
	end,
}
