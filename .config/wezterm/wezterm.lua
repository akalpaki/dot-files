local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- window
config.initial_cols = 220
config.initial_rows = 60
-- config.color_scheme = 'Apple System Colors'
config.enable_tab_bar = false

-- font
config.font_size = 24
config.font = wezterm.font('GohuFont 14 Nerd Font')
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.default_cursor_style = 'SteadyBlock'

return config
