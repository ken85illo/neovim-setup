return {
    'stevearc/conform.nvim',
    dependencies = {
        {
            'zapling/mason-conform.nvim',
            config = function()
                require('mason-conform').setup {
                    ensure_installed = {
                        'stylua', --Lua
                        'ruff', -- Python
                        'clang-format', --C/C++
                    },
                }
            end,
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
            c = { 'clang-format' },
            cpp = { 'clang-format' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
