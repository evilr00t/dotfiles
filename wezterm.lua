-- by evilroot <k@e-dot.uk>
--
local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- FullScreen on StartUp
-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.ssh_backend = "Ssh2"
config.force_reverse_video_cursor = true
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
-- config.font = wezterm.font("Pragmata Pro Mono")
-- config.font = wezterm.font({ family = "SauceCodePro Nerd Font Mono", weight = 500 })
-- config.font = wezterm.font({ family = "Monaspace Neon Var", weight = 650 })
config.font = wezterm.font({ family = "Cascadia Mono PL" })
config.window_background_opacity = 0.98
config.font_size = 13
config.window_decorations = "RESIZE"
config.mouse_wheel_scrolls_tabs = false
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.7 }
config.window_frame = { font = wezterm.font({ family = "Monaspace Krypton", weight = "Regular" }) }
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}
-- turn off ligatures - i just can't read those...
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.leader = { key = "b", mods = "CMD", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "l", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "h", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "Enter", mods = "CMD", action = act.ActivateCopyMode },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{
		key = "U",
		mods = "SHIFT|CTRL",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
	-- { key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	-- { key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
	--{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
	--{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
	--{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
	--{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "f", mods = "CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "b", mods = "LEADER|CTRL", action = act.SendString("\x03") },
	{ key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "z", mods = "CTRL", action = act.TogglePaneZoomState },
	{ key = "f", mods = "CTRL", action = act.Search({ CaseInSensitiveString = "" }) },
	{ key = "o", mods = "CTRL", action = wezterm.action({ PaneSelect = { mode = "SwapWithActive" } }) },
	{ key = "o", mods = "CMD", action = wezterm.action({ PaneSelect = {} }) },
}

config.colors = {
	-- The default text color
	foreground = "#C4BDB5",
	-- The default background color
	background = "#1E1E1E",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#C02030",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#00ff00",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	-- cursor_border = '#52ad70',

	-- the foreground color of selected text
	-- selection_fg = 'black',
	-- the background color of selected text
	-- selection_bg = '#fffacd',

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	-- scrollbar_thumb = '#222222',

	-- The color of the split lines between panes
	-- split = '#444444',

	ansi = {
		"#201020",
		"#e3443d",
		"#98971A",
		"#E7A931",
		"#458588",
		"#B16286",
		"#689E6A",
		"#C0B0A0",
	},
	brights = {
		"#928374",
		"#f65665",
		"#B5C033",
		"#FABE2F",
		"#99C6CA",
		"#D66282",
		"#8AE180",
		"#DDCCAA",
	},
}

config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks, and that it populates
	-- the Clipboard rather the PrimarySelection which is part
	-- of the default assignment for a left mouse click.
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("Clipboard"),
	},
}

-- and finally, return the configuration to wezterm
return config
