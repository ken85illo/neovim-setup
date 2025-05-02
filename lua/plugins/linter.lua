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

        lint.linters_by_ft = {
            lua = { 'luacheck' },
            python = { 'ruff' },
            c = { 'cpplint' },
            cpp = { 'cpplint' },
            json = { 'jsonlint' },
        }

        ---@diagnostic disable-next-line: missing-fields
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
            virtual_text = true,
            float = {
                border = 'single',
            },
        }
    end,
}
