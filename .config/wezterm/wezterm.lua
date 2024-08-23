-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.macos_window_background_blur = 20
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16.0
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}

-- (This is where our config will go)

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
