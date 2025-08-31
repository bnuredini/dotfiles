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
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{ key = "1", mods = "CTRL", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "CTRL", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "CTRL", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "CTRL", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "CTRL", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "CTRL", action = wezterm.action.ActivateTab(8) },
}

local mux = wezterm.mux
local window = nil

config.default_workspace = "ns"

wezterm.on("gui-startup", function()
	local tab_data = {
		{
			title = "todo",
			cwd = wezterm.home_dir .. "/documents",
			args = { "nvim", "todo.md" },
		},
		{
			title = "docs",
			cwd = wezterm.home_dir .. "/documents",
			args = { "nvim", "." },
		},
		{
			title = "files",
			cwd = wezterm.home_dir .. "/code",
			args = { "fish", "-c", "cd " .. wezterm.home_dir .. "/code/ns; yazi" },
		},
		{
			title = "editor",
			cwd = wezterm.home_dir .. "/code/ns",
			args = { "fish", "-c", "cd " .. wezterm.home_dir .. "/code/ns; nvim ." },
		},
		{
			title = "runner",
			cwd = wezterm.home_dir .. "/code/ns",
			args = { "fish", "-c", "cd " .. wezterm.home_dir .. "/code/ns; exec fish" },
		},
		{
			title = "db",
			cwd = wezterm.home_dir .. "/code/ns",
			args = { "fish", "-c", "cd " .. wezterm.home_dir .. "/code/ns; exec fish" },
		},
		{
			title = "ssh",
			cwd = wezterm.home_dir .. "/code/ns",
			args = { "fish", "-c", "cd " .. wezterm.home_dir .. "/code/ns; exec fish" },
		},
	}

	local window = nil
	local tab
	for i, tab_config in ipairs(tab_data) do
		if i == 1 then
			tab, _, window = mux.spawn_window({
				workspace = "ns",
				cwd = tab_config.cwd,
				args = tab_config.args,
			})
		else
			tab, _, _ = window:spawn_tab({
				cwd = tab_config.cwd,
				args = tab_config.args,
			})
		end

		tab:set_title(tab_config.title)
	end
end)

return config
