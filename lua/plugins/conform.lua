return {
    'stevearc/conform.nvim',
    dependencies = {
        {
            'zapling/mason-conform.nvim',
            config = function()
                require('mason-conform').setup {
                    ensure_installed = {
                        'stylua',
                    },
                }
            end,
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
