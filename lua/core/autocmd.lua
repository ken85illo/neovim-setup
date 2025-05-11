local api = vim.api
local autocmd = api.nvim_create_autocmd

-- Display a highlight when yanking text
autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- More efficient quitting method when opening temporary windows
autocmd('FileType', {
    pattern = {
        'help',
        'man',
        'qf',
        'lspinfo',
        'checkhealth',
        'spectre_panel',
        'vim',
        'notify',
        'toggleterm',
        'markdown',
    },

    callback = function()
        vim.keymap.set('n', 'q', '<cmd>q<CR>', { buffer = true, silent = true })
    end,
})

-- Make background transparent
autocmd({ 'ColorScheme', 'BufWinEnter', 'WinNew' }, {
    desc = 'Transparent background',
    pattern = '*',
    callback = function()
        api.nvim_set_hl(0, 'WinSeparator', { fg = '#292a29' }) -- Show Window Borders
        api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' }) -- Transparent Float Windows
        -- api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' }) -- Transparent Buffer Line
        api.nvim_set_hl(0, 'TabLine', { bg = 'NONE' }) -- Transparent Buffer Line

        -- Remove background for blink doc
        api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkCmpDocBorder', { bg = 'NONE', fg = '#7a7b7d' })
        api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { bg = 'NONE', fg = '#7a7b7d' })
    end,
})

autocmd({ 'InsertEnter' }, {
    callback = function()
        vim.lsp.inlay_hint.enable(true, nil)
    end,
})

autocmd({ 'InsertLeave' }, {
    callback = function()
        vim.lsp.inlay_hint.enable(false, nil)
    end,
})
