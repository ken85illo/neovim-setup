return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup {
            options = {
                diagnostics = 'nvim_lsp',
                tab_size = 0,
                close_command = 'bd! %d',
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        separator = false,
                    },
                },
            },
        }
    end,
}
