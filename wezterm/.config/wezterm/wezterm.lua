local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 9.0
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")

local dark_color_scheme = "Jellybeans"
local dark_background = "#151515"

local light_color_scheme = "AtomOneLight"
local light_background = "#F9F9F9"

config.color_scheme = dark_color_scheme
config.colors = {
	background = dark_background,
}

wezterm.on("toggle-color-scheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local current_color_scheme = overrides.color_scheme

	if current_color_scheme == light_color_scheme then
		overrides.color_scheme = dark_color_scheme
		overrides.colors = {
			background = dark_background,
		}
	else
		overrides.color_scheme = light_color_scheme
		overrides.colors = {
			background = light_background,
		}
	end

	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "[",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateLastTab,
	},
	{
		key = "m",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ EmitEvent = "toggle-color-scheme" }),
	},
}

return config
