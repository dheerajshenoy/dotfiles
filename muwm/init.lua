local map = mu.keybind

mu.opts.gaps = {
    value = 20,
    smart = false,
}

mu.opts.border = {
    focused = "#FF500011",
    -- unfocused = "gray",
    smart = false,
}

mu.opts.workspaces = { "1", "2", "3" }

mu.opts.keyboard.xkb_options = "ctrl:swapcaps"
mu.opts.new_client_position = "bottom"

map("Super+Shift+Return", function() mu.spawn("$TERMINAL") end)
map("Super+Shift+C", mu.quit)
map("Super+J", mu.focus_next)
map("Super+K", mu.focus_prev)
map("Super+Shift+J", mu.swap_next)
map("Super+Shift+K", mu.swap_prev)
map("Super+Return", mu.swap_master)
map("Super+Shift+Q", mu.close)
map("Super+Shift+R", mu.reload)
map("Super+F", mu.toggle_fullscreen)
map("Super+T", mu.toggle_floating)
map("Super+L", function() mu.focus_output("right") end)
map("Super+H", function() mu.focus_output("left") end)
map("Super+Shift+Period", function() mu.move_to_output("right") end)
map("Super+Shift+Comma", function() mu.move_to_output("left") end)

-- bindsym --locked XF86AudioMute exec pactl set-sink-mute \@DEFAULT_SINK@ toggle
-- bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume \@DEFAULT_SINK@ -5%
-- bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume \@DEFAULT_SINK@ +5%
-- bindsym --locked XF86AudioMicMute exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle
-- # Special keys to adjust brightness via brightnessctl
-- bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
-- bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+

map("XF86AudioMute", function() mu.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end)
map("XF86AudioLowerVolume", function() mu.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end)
map("XF86AudioRaiseVolume", function() mu.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end)
map("XF86AudioMicMute", function() mu.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle") end)
map("XF86MonBrightnessDown", function() mu.spawn("brightnessctl set 5%-") end)
map("XF86MonBrightnessUp", function() mu.spawn("brightnessctl set 5%+") end)


map("Super+Alt+H", function()
    if mu.opts.layout.master_ratio > 0.05 then
        mu.opts.layout.master_ratio = mu.opts.layout.master_ratio - 0.05
    end
end)
map("Super+Alt+L", function()
    if mu.opts.layout.master_ratio < 0.95 then
        mu.opts.layout.master_ratio = mu.opts.layout.master_ratio + 0.05
    end
end)

for i = 1, #mu.opts.workspaces do
    map("Super+" .. i, function() mu.focus_workspace(i) end)
end

for i = 1, #mu.opts.workspaces do
    map("Super+Shift+" .. i, function() mu.window_to_workspace(i) end)
end

map("Super+P", function() mu.spawn("rofi -show drun") end)

mu.on("config_reload", function()
    mu.spawn("swaybg -i ~/Gits/wallpapers/50.png")
    mu.spawn("kanshi")
    mu.spawn("quickshell kill; quickshell")
end)
