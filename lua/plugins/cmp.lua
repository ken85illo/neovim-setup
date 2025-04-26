return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'onsails/lspkind.nvim',
        'roobert/tailwindcss-colorizer-cmp.nvim',

        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
        {
            'folke/lazydev.nvim',
            ft = 'lua', -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
    },
    opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
            name = 'lazydev',
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
    end,
    config = function()
        local cmp = require 'cmp'

        cmp.setup {
            -- Autoselect first choice
            completion = { completeopt = 'menu,menuone,noinsert' },

            -- Show ghost text
            experimental = {
                ghost_text = true,
            },

            -- Add Borders
            window = {
                documentation = cmp.config.window.bordered(),
            },
            -- Expand snippet
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-p>'] = cmp.mapping.select_prev_item { behavior = 'select' },
                ['<C-n>'] = cmp.mapping.select_next_item { behavior = 'select' },
                ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = 'select' },
                ['<Tab>'] = cmp.mapping.select_next_item { behavior = 'select' },

                ['<CR>'] = cmp.mapping.confirm { select = false },
                ['<C-y>'] = cmp.mapping.confirm { select = false },

                ['<C-Space>'] = cmp.mapping.complete(),

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            },

            formatting = {
                format = require('lspkind').cmp_format {
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...',
                    show_labelDetails = true,
                    before = require('tailwindcss-colorizer-cmp').formatter,
                },
            },
        }

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' },
                    },
                },
            }),
        })
    end,
}
