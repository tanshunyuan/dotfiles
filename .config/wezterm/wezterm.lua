-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Nord (Gogh)'
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.keys = {
  {
    key = '\\',
    mods = 'CMD',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Right',
  },
}

-- and finally, return the configuration to wezterm
return config
