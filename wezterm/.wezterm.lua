local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.disable_default_key_bindings = true

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 16.0
config.default_domain = "WSL:Ubuntu-24.04"

config.keys = {
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},
}

return config
