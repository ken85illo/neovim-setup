return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            globalstatus = true,
        },

        -- Show macro indicator in statusline
        extensions = {
            'mason',
            'nvim-dap-ui',
            'toggleterm',
            'lazy',
        },
    },
}
