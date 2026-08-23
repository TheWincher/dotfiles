local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	enable_wayland = false,
	font_size = 13.0,
	color_scheme = "Catppuccin Frappe",
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	window_background_opacity = 0.9,
	window_decorations = "NONE",
	keys = {
		{
			key = "m",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ToggleFullScreen,
		},
	},
}
