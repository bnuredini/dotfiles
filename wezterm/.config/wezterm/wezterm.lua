local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 12.0
config.window_decorations = "RESIZE"
config.color_scheme = "Jellybeans"
config.colors = {
	background = "#151515",
}

config.keys = {
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return config
