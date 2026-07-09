return {
    'williamboman/mason.nvim',
    {
        'mfussenegger/nvim-lint',
        dependencies = {
            {
                'sontungexpt/better-diagnostic-virtual-text',
                event = 'LspAttach',
                config = function(_)
                    require('better-diagnostic-virtual-text').setup()
                end,
            },
        },
        config = function()
            local lint = require 'lint'

            lint.linters_by_ft = {
                lua = { 'luacheck' },
                javascript = { 'eslint_d' },
                typescript = { 'eslint_d' },
                javascriptreact = { 'eslint_d' },
                typescriptreact = { 'eslint_d' },
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
                -- virtual_text = true,
                float = {
                    border = 'single',
                },
            }
        end,
    },
}
