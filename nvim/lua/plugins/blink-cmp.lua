return {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '1.*',       -- release tag = prebuilt binary, no cargo build
    -- build = 'cargo build --release',   -- remove this line if you have it
    opts = {
        keymap = { preset = 'default' },
        sources = { default = { 'lsp', 'path', 'buffer' } },
    },
}
