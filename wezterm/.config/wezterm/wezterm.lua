local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Jellybeans"
config.colors = {
	background = "#151515",
}

config.font_size = 9.0

config.keys = {
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return config
