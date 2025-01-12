local wezterm = require 'wezterm'
local config = {
    -- these can be overriden 
    window_decorations = 'INTEGRATED_BUTTONS|TITLE',
    enable_tab_bar = true,

    -- these are not overriden
    colors = {
        cursor_bg = '#ffffff',
        cursor_fg = '#0C0C0C',
        cursor_border = '#ffffff',
	tab_bar = {
	    background = '#0d0e12',
	    new_tab = {
		bg_color = '#040505',
		fg_color = '#e8e9eb',
	    },
	}
    },
    window_background_opacity = 1.0,
    window_background_image = "C:/same/profiles/term/bg/dm.png",
    window_background_image_hsb = {
	brightness = 1.0,
	hue = 1.0,
	saturation = 1.0,
    }, 
    window_padding = {
	    left = 8,
	    right = 8,
	    top = 8,
	    bottom = 8,
    },
    font = wezterm.font("3270 Nerd Font", { weight = 400 }),
    font_size = 13.0,
    font_rasterizer = "FreeType",
    freetype_render_target = "HorizontalLcd",
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
	"wslhost.exe",
	"conhost.exe", -- this is needed for wsl2 ubuntu
    },
    launch_menu = {
	    {
		    label = "Ubuntu WSL",
		    domain = { DomainName = "WSL:Ubuntu" },
	    },
	    {
		    label = "PowerShell",
		    args = { "powershell.exe", "-NoLogo" },
		    domain = { DomainName = "local" },
	    },
	    {
		    label = "CMD",
		    args = { "cmd.exe" },
		    domain = { DomainName = "local" },
	    },
    },
}

config.hide_tab_bar_if_only_one_tab = false
config.freetype_load_flags = 'NO_HINTING'
config.max_fps = 144

-- hide tab bar in full screen
function fullscreen_toggle(window, pane)
    local overrides = window:get_config_overrides() or {}
    local is_fullscreen = window:get_dimensions().is_full_screen
    
    if is_fullscreen then
        overrides.enable_tab_bar = false
	wezterm.sleep_ms(10)
        overrides.window_decorations = 'NONE'
	wezterm.log_info("Setting to fullscreen mode")
    else
        overrides.enable_tab_bar = true
        overrides.window_decorations = 'INTEGRATED_BUTTONS|TITLE'
    end
    
    window:set_config_overrides(overrides)
end

wezterm.on('window-resized', fullscreen_toggle)

return config
