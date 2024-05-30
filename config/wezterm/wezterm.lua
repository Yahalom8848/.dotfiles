local wezterm = require("wezterm")

return {
	-- ===================================================================
	-- * Theme
	-- ===================================================================

	color_scheme = "Tokyo Night",
	window_background_opacity = 0.9,

	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	initial_cols = 100,

	-- ===================================================================
	-- * Font
	-- ===================================================================

	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 10,
}
