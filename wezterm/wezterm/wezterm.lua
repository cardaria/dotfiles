-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'Grayscale (light) (terminal.sexy)'

config.colors = {
foreground = "#2e3338",
background = "#ffffff",
cursor_bg = "#000000",
cursor_border = "#000000",
cursor_fg = "#ffffff",
selection_bg = "#cccccc",
selection_fg = "#000000",

  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#E7E5E4',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#ffffff',
      -- The color of the text for the tab
      fg_color = '#2e3338',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#E7E5E4',
      fg_color = '#2e3338',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#D9D8D8',
      fg_color = '#2e3338',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#E7E5E4',
      fg_color = '#2e3338',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#D9D8D8',
      fg_color = '#2e3338',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}
config.max_fps = 144
config.window_decorations = "RESIZE"
config.font_size = 19
config.font = wezterm.font 'Berkeley Mono'
config.enable_tab_bar = true
config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	}

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 600
config.animation_fps = 144

-- tmux
config.keys = {
    {
        mods = "CTRL",
        key = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "CTRL",
        key = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "CTRL",
        key = "k",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = "CTRL",
        key = "b",
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods = "CTRL",
        key = "ö",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods = "CTRL",
        key = "å",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods = "CTRL",
        key = "t",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods = "CTRL",
        key = "n",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods = "CTRL",
        key = "j",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods = "CTRL",
        key = "s",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods = "CTRL",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
        mods = "CTRL",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
        mods = "CTRL",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
        mods = "CTRL",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
}

for i = 0, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i),
    })
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true


-- tmux status
wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = { Foreground = { Color = "#ffffff" } }
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a) -- ocean wave
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = { Foreground = { Color = "#E7E5E4" } }
    end -- arrow color based on if tab is first pane

    window:set_left_status(wezterm.format {
        { Background = { Color = "#E7E5E4" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)
-- and finally, return the configuration to wezterm
return config
