return {
    'stevearc/conform.nvim',
    lazy = false,
    dependencies = {
        {
            'zapling/mason-conform.nvim',
            config = function()
                require('mason-conform').setup {}
            end,
        },
    },
    keys = {
        {
            '<leader>f',
            '<Nop>',
            desc = 'Format Settings',
        },
        {
            '<leader>ft',
            function()
                -- If autoformat is currently disabled for this buffer,
                -- then enable it, otherwise disable it
                if vim.b.disable_autoformat then
                    vim.cmd 'FormatEnable'
                    vim.notify 'Enabled autoformat for current buffer'
                else
                    vim.cmd 'FormatDisable!'
                    vim.notify 'Disabled autoformat for current buffer'
                end
            end,
            desc = 'Toggle autoformat for current buffer',
        },
        {
            '<leader>fT',
            function()
                -- If autoformat is currently disabled globally,
                -- then enable it globally, otherwise disable it globally
                if vim.g.disable_autoformat then
                    vim.cmd 'FormatEnable'
                    vim.notify 'Enabled autoformat globally'
                else
                    vim.cmd 'FormatDisable'
                    vim.notify 'Disabled autoformat globally'
                end
            end,
            desc = 'Toggle autoformat globally',
        },
    },
    opts = {
        async = true,
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            json = { 'prettier' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            css = { 'prettier' },
            sh = { 'beautysh' },
            bash = { 'beautysh' },
            cs = { 'csharpier' },
        },
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end

            return {
                timeout_ms = 500,
                lsp_format = 'fallback',
            }
        end,
    },
    config = function(_, opts)
        require('conform').setup(opts)

        vim.api.nvim_create_user_command('FormatDisable', function(args)
            if args.bang then
                -- :FormatDisable! disables autoformat for this buffer only
                vim.b.disable_autoformat = true
            else
                -- :FormatDisable disables autoformat globally
                vim.g.disable_autoformat = true
            end
        end, {
            desc = 'Disable autoformat-on-save',
            bang = true, -- allows the ! variant
        })

        vim.api.nvim_create_user_command('FormatEnable', function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = 'Re-enable autoformat-on-save',
        })
    end,
}
