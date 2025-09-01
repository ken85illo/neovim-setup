return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    event = 'VimEnter',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        -- Set header
        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }

        -- Set Menu
        dashboard.section.buttons.val = {
            dashboard.button('e', '  New file', ':enew <BAR> startinsert <CR>'),
            dashboard.button('f', '  Find File', ':Telescope find_files <CR>'),
            dashboard.button('g', '  Find Text', ':Telescope grep_string <CR>'),
            dashboard.button('s', '  Restore Session', ':AutoSession restore<CR>'),
            dashboard.button('l', '󰒲  Lazy', ':Lazy <cr>'),
            dashboard.button('q', '  Quit', ':qa <cr>'),
        }

        local fortune = require 'alpha.fortune'
        dashboard.section.footer.val = fortune()

        alpha.setup(dashboard.opts)
    end,
}
