lektra.cmd.register("dj-search-tabs", function()
    -- Two columns: the tab index (1-based, what lektra.tabs.switch takes) and
    -- the title. The picker gives on_accept the first column of the chosen row.
    local current = lektra.tabs.current():index()
    local items = {}
    for _, tab in ipairs(lektra.tabs.list()) do
        local title = tab:title()
        if tab:index() == current then
            title = title .. "  (current)"
        end
        table.insert(items, { tostring(tab:index()), title })
    end

    lektra.ui.picker({
        prompt = "Select a tab:",
        items = items,
        columns = { "#", "Title" },
        flat = true,
        on_accept = function(number)
            local n = tonumber(number)
            if n then
                lektra.tabs.switch(n)
            end
        end,
    })
end)

lektra.cmd.register("dj-link-hint-preview", function()
    local view = lektra.view.current()
    if not view then
        return
    end

    local _ = view:link_hints("pick", function(link)
        view:preview(link)
    end)
end, "Preview a link hint in the current view")

lektra.cmd.register("dj-open-file-location", function()
    local view = lektra.view.current()
    if view then
        local fp = view:file_path()
        local parent_dir = fp:match("(.+)/[^/]+$") -- Extract the parent directory
    end
end)
