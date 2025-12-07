return {
    'stevearc/conform.nvim',
    dependencies = {
        {
            'zapling/mason-conform.nvim',
            config = function()
                require('mason-conform').setup {}
            end,
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
            js = { 'prettier' },
            css = { 'prettier' },
            sh = { 'beautysh' },
            bash = { 'beautysh' },
            cs = { 'csharpier' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
