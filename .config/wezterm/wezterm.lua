local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Setup neapsix (Rosé Pine) theme with error handling
local theme = nil
local theme_ok, theme_plugin = pcall(function()
	return wezterm.plugin.require("https://github.com/neapsix/wezterm").main
end)
if theme_ok then
	theme = theme_plugin
end

-- Setup tabline plugin with error handling
local tabline = nil
local tabline_ok, tabline_plugin = pcall(function()
	return wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
end)
if tabline_ok and tabline_plugin then
	tabline = tabline_plugin
	-- Setup tabline with custom configuration
	tabline.setup({
		options = {
			icons_enabled = true,
			tabs_enabled = true,
		},
		sections = {
			tabline_a = { " TUAN " },
			tabline_b = {},
			tab_active = {
				"index",
				{ "parent", padding = 0 },
				"/",
				{ "cwd", padding = { left = 0, right = 1 } },
			},
			tabline_x = { "ram", "cpu" },
			tabline_y = {},
			tabline_z = {},
		},
	})
	-- Apply tabline configuration to config
	tabline.apply_to_config(config)
end

-- Initialize keys array
config.keys = config.keys or {}

-- Font configuration
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

-- Shell configuration
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

-- Remove window padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Apply neapsix theme colors if available
if theme then
	config.colors = theme.colors()
	config.window_frame = theme.window_frame()
end
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- Enable enhanced key protocol for better key handling
config.enable_kitty_keyboard = true

-- Enable key event debugging
config.debug_key_events = true

-- Custom events for Vim/Neovim key mappings using direct commands
wezterm.on("copy_to_clipboard", function(window, pane)
	local process_name = pane:get_foreground_process_name() or ""
	if process_name:match("vim") or process_name:match("nvim") then
		-- Try a different approach: escape to normal mode first, then send the sequence
		window:perform_action(wezterm.action.SendKey({ key = "Escape" }), pane)
		window:perform_action(wezterm.action.SendString('"*y'), pane)
	else
		window:perform_action(wezterm.action.CopyTo("Clipboard"), pane)
	end
end)

wezterm.on("paste_from_clipboard", function(window, pane)
	local process_name = pane:get_foreground_process_name() or ""
	if process_name:match("vim") or process_name:match("nvim") then
		-- Direct paste from system clipboard
		window:perform_action(wezterm.action.SendKey({ key = "Escape" }), pane)
		window:perform_action(wezterm.action.SendString('"*p'), pane)
	else
		window:perform_action(wezterm.action.PasteFrom("Clipboard"), pane)
	end
end)

wezterm.on("save_file", function(window, pane)
	local process_name = pane:get_foreground_process_name() or ""
	if process_name:match("vim") or process_name:match("nvim") then
		-- Direct save command
		window:perform_action(wezterm.action.SendKey({ key = "Escape" }), pane)
		window:perform_action(wezterm.action.SendString(":w\r"), pane)
	else
		-- Default save behavior for non-nvim processes
		window:perform_action(wezterm.action.SendKey({ key = "s", mods = "CMD" }), pane)
	end
end)

wezterm.on("undo_change", function(window, pane)
	local process_name = pane:get_foreground_process_name() or ""
	if process_name:match("vim") or process_name:match("nvim") then
		-- Direct undo command
		window:perform_action(wezterm.action.SendKey({ key = "Escape" }), pane)
		window:perform_action(wezterm.action.SendString("u"), pane)
	else
		-- Default undo behavior for non-nvim processes
		window:perform_action(wezterm.action.SendKey({ key = "z", mods = "CMD" }), pane)
	end
end)

-- Add our custom key mappings
local custom_keys = {
	-- Cmd+C (Copy)
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.EmitEvent("copy_to_clipboard"),
	},
	-- Cmd+V (Paste)
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.EmitEvent("paste_from_clipboard"),
	},
	-- Cmd+S (Save)
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.EmitEvent("save_file"),
	},
	-- Cmd+Z (Undo)
	{
		key = "z",
		mods = "CMD",
		action = wezterm.action.EmitEvent("undo_change"),
	},
}

-- Merge custom keys with existing keys
for _, key in ipairs(custom_keys) do
	table.insert(config.keys, key)
end

return config
