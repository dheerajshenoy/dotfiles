local opt = lektra.opt

opt.behavior.dont_invert_images = false
opt.menubar.show = false
opt.command_palette.sort_by_frequency = true
opt.command_palette.description = true
opt.behavior.remember_last_visited = true
opt.tabs = {
    auto_hide = true,
    min_width = 120,
    full_path = true,
    scroll_text_on_hover = true,
    lazy_load = true,
}

opt.scrollbars = {
    horizontal = false,
    vertical = true,
}

opt.rendering.page_shadow = {
    enabled = true,
    radius = 10,
}

opt.layout.spacing = 20

opt.llm_view = {
    api_url = "http://localhost:11434/v1/chat/completions",
    api_key = "",
    model = "qwen3.5:4b",
    font_size = 12,
    extra_body = {
        ["stream"] = true,
        ["temperature"] = 0.2,
        ["reasoning_effort"] = "none", -- in place of "think"; test this
    },
}

opt.statusbar = {
    padding = 0,
    layout = {
        left = { "portal", "narrow", "session", "filename", "session" },
        center = { "page" },
        right = { "progress", "mode" },
    },
}

-- opt.behavior.single_instance = true
opt.links.hover_preview = {
    page_number = false,
    enabled = true,
    width = 800,
    height = 600,
}

-- opt.picker.highlight = true
opt.laser_pointer.trail.enabled = true
opt.behavior.keep_view = true

opt.annotations.glow.enabled = false
opt.annotations.popup.comment.latex = true

opt.presentation = {
    fit_mode = lektra.FitMode.Width,
    allowed_actions = { "zoom_in", "zoom_out", "next_page", "previous_page" },
    laser_on_start = true,
}


opt.picker = {
    show_header = false,
    style = "emacs",
    scrolloff = 4,
    max_lines = 10,
    keys = {
        down = { "Down", "Ctrl+j" },
        up = { "Up", "Ctrl+k" }
    },
    highlight_matches = { color = 0xFF5000FF }
}

opt.minimap.enabled = false
