local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config = {
	-- FONT
	font = wezterm.font("Hack Nerd Font Mono"),
	font_size = 14,
	color_scheme = "Catppuccin Mocha",
	freetype_load_target = "Light",
	-- GENERAL
	send_composed_key_when_left_alt_is_pressed = true,
	automatically_reload_config = true,
	scrollback_lines = 10000,

	-- WINDOW
	initial_rows = 60,
	initial_cols = 150,
	window_decorations = "RESIZE",
	window_padding = {
		top = 20,
		right = 3,
		bottom = 0,
		left = 20,
	},

	-- TAB
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = false,

	-- TMUX LEADER
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 },

	-- KEYS
	keys = {
		{
			mods = "LEADER",
			key = "-",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "|",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "m",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			mods = "LEADER",
			key = "0",
			action = wezterm.action.PaneSelect({
				mode = "SwapWithActive",
			}),
		},
		{
			mods = "LEADER",
			key = "LeftArrow",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			mods = "LEADER",
			key = "RightArrow",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			mods = "LEADER",
			key = "UpArrow",
			action = act.AdjustPaneSize({ "Up", 5 }),
		},
		{
			mods = "LEADER",
			key = "DownArrow",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{
			mods = "CTRL",
			key = "b",
			action = act.ActivateTabRelative(-1),
		},
		{
			mods = "CTRL",
			key = "n",
			action = act.ActivateTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "n",
			action = act.MoveTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "b",
			action = act.MoveTabRelative(-1),
		},
		{
			mods = "LEADER",
			key = "c",
			action = act.SwitchToWorkspace,
		},
		{
			mods = "CTRL",
			key = "x",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "CTRL",
			key = "h",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			mods = "CTRL",
			key = "j",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			mods = "CTRL",
			key = "k",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			mods = "CTRL",
			key = "l",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			mods = "LEADER",
			key = ",",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			mods = "LEADER",
			key = ".",
			action = act.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		{
			mods = "LEADER",
			key = "s",
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
	},
}

wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#b7bdf8" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

return config
