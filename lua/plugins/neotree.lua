return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
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
