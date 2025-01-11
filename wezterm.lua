local wezterm = require 'wezterm'
local config = {
    colors = {
        cursor_bg = '#ffffff',
        cursor_fg = '#0C0C0C',
        cursor_border = '#ffffff',
    },
    window_background_opacity = 1.0,
    window_background_image = "C:/same/profiles/term/bg/dm.png",
    window_background_image_hsb = {
	brightness = 1.0,
	hue = 1.0,
	saturation = 1.0,
    },
    font = wezterm.font("3270 Nerd Font"),
    font_size = 12.5,
    window_decorations = "INTEGRATED_BUTTONS|TITLE",
    window_frame = {
	active_titlebar_bg = "#ffffff",  -- Darker color for title bar
    },
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    default_domain = "WSL:Ubuntu",
    cursor_blink_rate = 500,
    cursor_blink_ease_in = "Linear",
    cursor_blink_ease_out = "Linear",
    default_cursor_style = "BlinkingBlock",
    window_close_confirmation = "NeverPrompt",
    skip_close_confirmation_for_processes_named = {
        "bash",
        "sh",
        "zsh",
        "fish",
        "tmux",
        "nu",
        "cmd.exe",
        "powershell.exe",
        "ubuntu.exe",
        "ubuntu2004.exe",
        "wsl.exe",
    },
    launch_menu = {
	    {
		    label = "Ubuntu WSL",
		    domain = { DomainName = "WSL:Ubuntu" },
	    },
	    {
		    label = "PowerShell",
		    args = { "powershell.exe", "-NoLogo" },
	    },
	    {
		    label = "CMD",
		    args = { "cmd.exe" },
	    },
    },
}

-- hide tab bar in full screen
config.hide_tab_bar_if_only_one_tab = false
wezterm.on('update-status', function(window, pane)
    local is_fullscreen = window:get_dimensions().is_full_screen
    if is_fullscreen then
        window:set_config_overrides({
            enable_tab_bar = false,
        })
    else
        window:set_config_overrides({
            enable_tab_bar = true,
        })
    end
end)

return config
