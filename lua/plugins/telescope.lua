return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            '1riz/telescope-macros.nvim',
            config = function()
                require('telescope').load_extension 'macros'
            end,
        },
    },
    keys = function()
        local builtin = require 'telescope.builtin'

        -- [[Telescope Keymaps]]
        return {
            { mode = 'n', '<leader>s', '<Nop>', desc = 'Search Telescope', silent = true },
            { mode = 'n', '<leader><leader>', builtin.buffers, desc = 'Telescope Buffers', silent = true },
            { mode = 'n', '<leader>sf', builtin.find_files, desc = 'Files', silent = true },
            { mode = 'n', '<leader>sg', builtin.live_grep, desc = 'Live Grep', silent = true },
            { mode = 'n', '<leader>sh', builtin.help_tags, desc = 'Tags', silent = true },
            { mode = 'n', '<leader>s/', builtin.search_history, desc = 'Search History', silent = true },
            { mode = 'n', '<leader>sa', builtin.autocommands, desc = 'Autocmds', silent = true },
            { mode = 'n', '<leader>s"', builtin.registers, desc = 'Registers', silent = true },
            { mode = 'n', "<leader>s'", builtin.marks, desc = 'Marks', silent = true },
            { mode = 'n', '<leader>sk', builtin.keymaps, desc = 'Keymaps', silent = true },
            { mode = 'n', '<leader>sc', builtin.highlights, desc = 'Highlights', silent = true },
            { mode = 'n', '<leader>sn', '<cmd>Telescope notify <CR>', desc = 'Notifications', silent = true },
            { mode = 'n', '<leader>s@', builtin.macros, desc = 'Macros', silent = true },
            { mode = 'n', '<leader>s:', builtin.commands, desc = 'Commands', silent = true },
            { mode = 'n', '<leader>sm', builtin.man_pages, desc = 'Man Pages', silent = true },
            { mode = 'n', '<leader>sd', builtin.diagnostics, desc = 'Diagnostics', silent = true },
        }
    end,
    config = function()
        local actions = require 'telescope.actions'

        require('telescope').setup {
            defaults = {
                initial_mode = 'normal',
                mappings = {
                    n = {
                        ['q'] = actions.close,
                    },
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown {},
                },
            },
        }
        require('telescope').load_extension 'ui-select'
    end,
}
