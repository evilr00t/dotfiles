-- by evilroot <k@e-dot.uk>
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}
local act = wezterm.action
local mux = wezterm.mux
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.ssh_backend = "Ssh2"
config.color_scheme = 'nightfox'
config.line_height = 1.2
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'FantasqueSansM Nerd Font'
config.font_size = 13.0
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.7 }
config.window_frame = { font = wezterm.font { family = 'Noto Sans', weight = 'Bold' }}
config.tab_bar_at_bottom = true
config.leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 2000 }
config.keys = {
  { key = 'l', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },
  { key = 'h', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up', },
  { key = 'Enter', mods = 'CMD', action = act.ActivateCopyMode },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
  { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'f', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentTab{ confirm = false } },
  { key = 'x', mods = 'CMD', action = act.CloseCurrentPane{ confirm = false } },
  { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02', },
  { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode, },
  { key = 'k', mods = 'CTRL|ALT', action = act.Multiple
    {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' }
    }
  },
  { key = 'z', mods = 'CTRL', action = act.TogglePaneZoomState },
  { key = 'f', mods = 'CTRL', action = act.Search { CaseInSensitiveString = '' } },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
}

config.colors = {
  -- The default text color
  foreground = '#C4BDB5',
  -- The default background color
  background = '#1E1E1E',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#C02030',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = '#00ff00',
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
    '#201020',
    '#CC241D',
    '#98971A',
    '#E7A931',
    '#458588',
    '#B16286',
    '#689E6A',
    '#C0B0A0',
  },
  brights = {
    '#928374',
    '#F42C3E',
    '#B5C033',
    '#FABE2F',
    '#99C6CA',
    '#D66282',
    '#8AE180',
    '#DDCCAA',
  },
}
-- and finally, return the configuration to wezterm
return config
