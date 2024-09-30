return {
	"zbirenbaum/copilot.lua",
	enabled = false,
	event = "InsertEnter",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-a>",
				},
			},
		})
	end,
}
