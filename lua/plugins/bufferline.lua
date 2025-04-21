return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup{
            options = {
                diagnostics = 'nvim_lsp',
                tab_size = 0,
                close_command = 'bd! %d|bp',
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' },
                },
                indicator = {
                    style = 'none',
                },
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        separator = false, 
                    },
                },
            },
            highlights = {
                separator = {
                    fg = "#0c0c0c",
                },
                tab_selected = {
                    fg = "#4e9fe5",
                },
                tab_separator = {
                    fg = "#0c0c0c",
                },
                tab_separator_selected = {
                    fg = "#0c0c0c",
                },
            },
        }
    end,
}
