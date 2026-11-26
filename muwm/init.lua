mu.config {
    gaps = { size = 20, smart = false },
    mouse = { accel_profile = "flat", accel_speed = 0.5 },
    touchpad = { tap_to_click = true, natural_scroll = true },
    border = {
        -- sticky = "#00FF0011",
        focused = "#FF500011",
        -- unfocused = "gray",
        smart = false,
    },
    keyboard = { xkb_options = "ctrl:swapcaps" },
    workspaces = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    dynamic_workspaces = true,
    new_client_position = "bottom",
    -- opacity = { unfocused = 0.8, active = 1.0 },
    dim = { modal = 0.4 },
}

-- A string runs as a shell command; a function is called.
mu.bind {
    ["Super+Shift+Return"] = "$TERMINAL",
    ["Super+P"] = "rofi -show drun",
    ["Super+F2"] = "pcmanfm",
    ["Super+F7"] = [[grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy]],

    ["XF86AudioMute"] = "pactl set-sink-mute @DEFAULT_SINK@ toggle",
    ["XF86AudioLowerVolume"] = "pactl set-sink-volume @DEFAULT_SINK@ -5%",
    ["XF86AudioRaiseVolume"] = "pactl set-sink-volume @DEFAULT_SINK@ +5%",
    ["XF86AudioMicMute"] = "pactl set-source-mute @DEFAULT_SOURCE@ toggle",
    ["XF86MonBrightnessDown"] = "brightnessctl set 5%-",
    ["XF86MonBrightnessUp"] = "brightnessctl set 5%+",

    ["Super+Shift+C"] = mu.quit,
    ["Super+Shift+R"] = mu.reload,
    ["Super+Shift+Q"] = mu.close,
    ["Super+F"] = mu.toggle_fullscreen,
    ["Super+T"] = mu.toggle_floating,

    ["Super+J"] = function() mu.focus("next") end,
    ["Super+K"] = function() mu.focus("prev") end,
    ["Super+L"] = function() mu.focus("right") end,
    ["Super+H"] = function() mu.focus("left") end,

    ["Super+Shift+J"] = function() mu.swap("next") end,
    ["Super+Shift+K"] = function() mu.swap("prev") end,
    ["Super+Return"] = function() mu.swap("master") end,

    ["Super+Shift+L"] = function() mu.move_to_output("right") end,
    ["Super+Shift+H"] = function() mu.move_to_output("left") end,

    ["Super+Ctrl+H"] = function()
        local layout = mu.config.layout
        if layout.master_ratio > 0.05 then
            layout.master_ratio = layout.master_ratio - 0.05
        end
    end,
    ["Super+Ctrl+L"] = function()
        local layout = mu.config.layout
        if layout.master_ratio < 0.95 then
            layout.master_ratio = layout.master_ratio + 0.05
        end
    end,

    ["Super+S"] = function()
        local w = mu.window
        if w then
            w.sticky = not w.sticky
        end
    end
}

mu.gesture { ["swipe3+left"] = mu.workspace_next, ["swipe3+right"] = mu.workspace_prev }

for i = 1, #mu.config.workspaces do
    -- Super+N shows workspace N; Super+Shift+N sends the focused window there.
    mu.bind("Super+" .. i, function()
        local ws = mu.workspaces[i]
        if ws then ws:show() end
    end)
    mu.bind("Super+Shift+" .. i, function()
        local w = mu.window
        if w then w:move_to_workspace(i) end
    end)
end

mu.on("config.reload", function()
    mu.spawn("swaybg -i ~/Gits/wallpapers/50.png")
    mu.spawn("kanshi")
    mu.spawn("quickshell kill; quickshell")
end)

mu.on("quit", function()
    mu.log("Mu is quitting, cleaning up...")
end)

-- Window rules go here, e.g.:
-- mu.rule({ app_id = "mpv" }, { floating = true })
-- mu.rule({ app_id = "firefox" }, { workspace = "2" })
