return {

    'williamboman/mason.nvim',
    {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'VeryLazy',
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
        end,
    },
    {
        'mfussenegger/nvim-lint',
        config = function()
            local lint = require 'lint'

            lint.linters_by_ft = {
                lua = { 'luacheck' },
                javascript = { 'eslint' },
                typescript = { 'eslint' },
                javascriptreact = { 'eslint' },
                typescriptreact = { 'eslint' },
                html = { 'htmlhint' },
            }

            lint.linters.luacheck = {
                cmd = 'luacheck',
                stdin = true,
                args = {
                    '--globals',
                    'vim',
                    'lvim',
                    'reload',
                    '--',
                },
                stream = 'stdout',
                ignore_exitcode = true,
                parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
                    source = 'luacheck',
                }),
            }

            vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                callback = function()
                    require('lint').try_lint()
                end,
            })
            vim.diagnostic.config {
                virtual_text = false,
                float = {
                    border = 'single',
                },
            }
        end,
    },
}
