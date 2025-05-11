return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        {
            'rcarriga/nvim-notify',
            opts = {
                background_colour = '#000000',
                max_width = 40,
            },
        },
    },
    opts = {
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        views = {
            hover = {
                border = {
                    style = 'single',
                },
                position = {
                    row = 2,
                },
            },
        },
        lsp = {
            signature = {
                auto_open = {
                    enabled = false,
                },
            },
        },
    },
}
