-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
-- my coolnight colorscheme
config = {
	colors = {
		foreground = "#CBE0F0",
		background = "#011423",
		cursor_bg = "#47FF9C",
		cursor_border = "#47FF9C",
		cursor_fg = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
		ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
		brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	},
	window_padding = {
		left = 5,
		right = 0,
		top = 0,
		bottom = 0,
	},

	font = wezterm.font("FiraCode Nerd Font", { weight = "Bold", stretch = "Normal" }),
	font_size = 18,

	enable_tab_bar = false,
	default_prog = { "/usr/local/bin/tmux", "new-session" },

	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	-- default_cursor_style = "SteadyBar",
	-- default_cursor_style = "SteadyUnderline",
	window_background_opacity = 0.75,
	macos_window_background_blur = 10,
}
return config
