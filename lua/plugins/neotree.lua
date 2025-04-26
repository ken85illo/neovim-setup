return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        {
            's1n7ax/nvim-window-picker',
            name = 'window-picker',
            event = 'VeryLazy',
            version = '2.*',
            config = function()
                require('window-picker').setup()
            end,
        },
    },
    opts = {
        filesystem = {
            use_libuv_file_watcher = true,
            filtered_items = {
                visible = true,
            },
        },
        source_selector = {
            statusline = true,
        },
    },
}
