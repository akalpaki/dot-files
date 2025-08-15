local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- window
config.initial_cols = 200
config.initial_rows = 60
config.color_scheme = 'Apple Classic'

-- font
config.font_size = 15
config.font = wezterm.font('DepartureMono Nerd Font')

return config
