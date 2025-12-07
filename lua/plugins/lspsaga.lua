return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup {
            lightbulb = {
                sign = true,
                virtual_text = false,
            },
            ui = {
                code_action = '',
            },
        }
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons', -- optional
    },
}
