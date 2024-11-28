-- Import the WezTerm API
local wezterm = require("wezterm")

-- Create a configuration table
local config = {}

-- -- Set the font to JetBrains Mono at size 24
config.font = wezterm.font("JetBrains Mono")
config.font_size = 24.0

config.colors = {
	foreground = "#F8F8F2",
	background = "#282A36",
	cursor_bg = "#FF79C6",
	cursor_border = "#FF79C6",
	cursor_fg = "#282A36",
	selection_bg = "#44475A",
	selection_fg = "#F8F8F2",
}

-- Performance optimizations
config.front_end = "OpenGL"
config.animation_fps = 60
config.max_fps = 120

-- Enable the tab bar
config.enable_tab_bar = false

-- Set the color scheme to Dracula
config.color_scheme = "Dracula"

-- Disable the confirmation prompt when closing a window
config.window_close_confirmation = "NeverPrompt"

-- Set window background opacity
config.window_background_opacity = 0.95

-- Set a background image
config.window_background_image = "/imagedir/2.jpg" -- Replace with the actual path to your image
config.window_background_image_hsb = {
	brightness = 0.05, -- Adjust brightness to blend with the terminal background
	hue = 1.0,
	saturation = 1.0,
}

-- Define custom key bindings
config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendString("clear\n"),
	},
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	--	Split horizontally with Command+Shift+D
	{
		key = "D",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Split vertically with Command+Shift+S
	{
		key = "S",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Close the current pane with Command+W
	{
		key = "W",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- Navigate to the pane on the left with Command+Left Arrow
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	-- Navigate to the pane on the right with Command+Right Arrow
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- Navigate to the pane above with Command+Up Arrow
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	-- Navigate to the pane below with Command+Down Arrow
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "T",
		mods = "CMD|SHIFT",
		action = wezterm.action.SendString("tmux new-session\n"),
	},
}

-- Right-click paste from the clipboard
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- Set scrollback lines
config.scrollback_lines = 10000

-- Set window padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Enable Vim keybindings in copy mode
config.key_tables = {
	copy_mode = {
		{ key = "h", mods = "NONE", action = wezterm.action.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = wezterm.action.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = wezterm.action.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = wezterm.action.CopyMode("MoveRight") },
		{
			key = "y",
			mods = "NONE",
			action = wezterm.action.Multiple({
				wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
				wezterm.action.CopyMode("ClearSelectionMode"),
			}),
		},
		{ key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
	},
}

-- Return the configuration to WezTerm
return config
