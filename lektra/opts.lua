local opt = lektra.opt

opt.behavior.dont_invert_images = false
opt.menubar.show = false
opt.command_palette.sort_by_frequency = true
opt.command_palette.description = true
opt.behavior.remember_last_visited = true
opt.tabs = {
    min_width = 120,
    full_path = true,
    scroll_text_on_hover = true,
    lazy_load = true,
}

opt.scrollbars = {
    horizontal = false,
    vertical = false,
}

opt.picker.keys.down = { "Down", "Ctrl+j" }
opt.picker.keys.up = { "Up", "Ctrl+k" }


opt.llm_view = {
    show_at_startup = false,
    api_url = "",
    api_key = "",
    model = "",
    font_size = 12,
    extra_body = {
        ["ctx"] = 2048,
        ["think"] = false,
        ["stream"] = true,
        ["temperature"] = 0.2,
    },
}

opt.statusbar = {
    padding = 10,
    layout = {
        left = { "filename", "session", "page" },
        right = { "progress", "mode" },
    },
}

-- opt.behavior.single_instance = true
opt.links.hover_preview = {
    enabled = true,
    width = 800,
    height = 600,
}

-- opt.picker.highlight = true
opt.picker.highlight_matches.color = 0xFF5000FF
opt.laser_pointer.trail.enabled = true
opt.behavior.keep_view = true

opt.annotations.highlight.glow.enabled = false

opt.presentation = {
    fit_mode = lektra.FitMode.Width,
    allowed_actions = { "zoom_in", "zoom_out", "next_page", "previous_page" },
    laser_on_start = true,
}

opt.minimap.enabled = false
