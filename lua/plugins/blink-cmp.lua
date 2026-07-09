return {
    {
        'saghen/blink.compat',
        version = '*',
        lazy = true, -- Automatically loads when required by blink.cmp
        opts = {},
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            {
                'folke/lazydev.nvim',
                ft = 'lua', -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                        { 'nvim-dap-ui' },
                    },
                },
            },
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
            {
                'brenoprata10/nvim-highlight-colors',
                config = function()
                    vim.opt.termguicolors = true
                    require('nvim-highlight-colors').setup {
                        render = 'virtual',
                    }
                end,
            },
            { 'Kaiser-Yang/blink-cmp-avante' },
            { 'fang2hou/blink-copilot' },
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
                                    if ctx.item.source_name == 'LSP' then
                                        local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                                        if color_item and color_item.abbr ~= '' then
                                            icon = color_item.abbr
                                        end
                                    end

                                    if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                        local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        end
                                    else
                                        local lspkind = require 'lspkind'
                                        icon = (lspkind.symbol_map and lspkind.symbol_map[ctx.kind]) or ctx.kind_icon
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                highlight = function(ctx)
                                    local hl = ctx.kind_hl

                                    if ctx.item.source_name == 'LSP' then
                                        local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                                        if color_item and color_item.abbr_hl_group then
                                            hl = color_item.abbr_hl_group
                                        end
                                    end

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
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'html-css', 'copilot', 'avante' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                    ['html-css'] = {
                        name = 'html-css',
                        module = 'blink.compat.source',
                    },
                    copilot = {
                        name = 'copilot',
                        module = 'blink-copilot',
                        score_offset = 100,
                        async = true,
                    },
                    avante = {
                        module = 'blink-cmp-avante',
                        name = 'Avante',
                        opts = {
                            -- options for blink-cmp-avante
                        },
                    },
                },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
}
