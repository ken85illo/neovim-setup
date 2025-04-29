return {
    'saghen/blink.cmp',
    dependencies = {
        'folke/lazydev.nvim',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
    },
    version = '1.*',
    opts = {
        snippets = { preset = 'luasnip' },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            ghost_text = {
                enabled = true,
            },
            documentation = {
                auto_show = true,
            },
        },
        cmdline = {
            completion = { menu = { auto_show = true } },
        },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },
            },
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
}
