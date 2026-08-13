return {
    'connorontheweb/ejs.nvim',
    lazy = true,
    ft = 'ejs',
    event = 'InsertEnter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional, recommended
        'neovim/nvim-lspconfig', -- optional
        'L3MON4D3/LuaSnip', -- optional
    },
    opts = {},
}
