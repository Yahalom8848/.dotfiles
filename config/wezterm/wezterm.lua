local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 10

config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 100

return config
