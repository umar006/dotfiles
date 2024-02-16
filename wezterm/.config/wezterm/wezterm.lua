local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.enable_tab_bar = false
-- config.window_padding = {
-- left = 1,
-- right = 1,
-- top = 1,
-- bottom = 1,
-- }
config.window_background_opacity = 0.8
config.window_decorations = "NONE"

-- config.color_scheme = 'rose-pine-moon'
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11
config.allow_square_glyphs_to_overflow_width = "Never"

return config
