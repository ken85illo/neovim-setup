return {
    'saghen/blink.cmp',
    dependencies = {
        'folke/lazydev.nvim',
        'nvim-tree/nvim-web-devicons',
        'onsails/lspkind.nvim',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
            opts = {
                enable_autosnippets = true,
            },
        },
    },
    version = '1.*',
    opts = {
        snippets = { preset = 'luasnip' },
        appearance = {
            nerd_font_variant = 'mono',
        },
        signature = {
            enabled = true,
            window = {
                border = 'single',
            },
        },
        completion = {
            ghost_text = {
                enabled = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = 'single' },
            },
            menu = {
                auto_show = true,
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                    local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require('lspkind').symbolic(ctx.kind, {
                                        mode = 'symbol',
                                    })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                    local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
                    },
                    columns = {
                        { 'label', 'label_description', gap = 1 },
                        { 'kind_icon', 'kind', gap = 1 },
                    },
                    treesitter = { 'lsp' },
                },
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
