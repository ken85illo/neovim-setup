return {
    'mfussenegger/nvim-lint',
    dependencies = {
        {
            'rshkarin/mason-nvim-lint',
            config = function()
                require('mason-nvim-lint').setup {}
            end,
        },
    },
    config = function()
        local lint = require 'lint'

        lint.linters_by_ft = {}

        vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
            callback = function()
                require('lint').try_lint()
            end,
        })

        vim.diagnostic.config {
            virtual_text = true,
            float = {
                border = 'single',
            },
        }
    end,
}
