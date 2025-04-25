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
