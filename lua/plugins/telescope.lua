return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-dap.nvim',
        {
            '1riz/telescope-macros.nvim',
            config = function()
                require('telescope').load_extension 'macros'
            end,
        },
    },
    keys = function()
        local builtin = require 'telescope.builtin'
        local telescope = require 'telescope'

        -- [[Telescope Keymaps]]
        return {
            { mode = 'n', '<leader>s', '<Nop>', desc = 'Search Telescope', silent = true },
            { mode = 'n', '<leader>sb', builtin.buffers, desc = 'Telescope Buffers', silent = true },
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
            { mode = 'n', '<leader>sw', builtin.diagnostics, desc = 'Diagnostics', silent = true },
            { mode = 'n', '<leader>sq', builtin.resume, desc = 'Continue Search', silent = true },
            { mode = 'n', '<leader>sd', '<Nop>', desc = 'Debug Search', silent = true },
            { mode = 'n', '<leader>sdc', "<cmd>lua require('telescope').extensions.dap.commands {} <CR>", desc = 'DAP Commands', silent = true },
            { mode = 'n', '<leader>sdo', "<cmd>lua require('telescope').extensions.dap.configurations {}<CR>", desc = 'DAP Configurations', silent = true },
            { mode = 'n', '<leader>sdb', "<cmd>lua require('telescope').extensions.dap.list_breakpoints {}<CR>", desc = 'DAP Breakpoints', silent = true },
            { mode = 'n', '<leader>sdv', "<cmd>lua require('telescope').extensions.dap.variables {}<CR>", desc = 'DAP Variables', silent = true },
            { mode = 'n', '<leader>sdf', "<cmd>lua require('telescope').extensions.dap.frames {}<CR>", desc = 'DAP Frames', silent = true },
        }
    end,
    config = function()
        local actions = require 'telescope.actions'

        require('telescope').setup {
            defaults = {
                initial_mode = 'insert',
                mappings = {
                    n = {
                        ['q'] = actions.close,
                    },
                },
                file_ignore_patterns = {
                    'node_modules',
                    'wwwroot',
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown {},
                },
            },
        }
        require('telescope').load_extension 'ui-select'
        require('telescope').load_extension 'dap'
    end,
}
