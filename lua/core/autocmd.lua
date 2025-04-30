local api = vim.api
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

-- Remove background of blink docs
api.nvim_set_hl(0, 'NoicePopupBorder', { bg = 'NONE' })

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
        api.nvim_set_hl(0, 'WinSeparator', { fg = '#27354c' }) -- Show Window Borders
        api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' }) -- Transparent Float Windows
        api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' }) -- Transparent Buffer Line
        api.nvim_set_hl(0, 'TabLine', { bg = 'NONE' }) -- Transparent Buffer Line

        -- Remove background for blink doc
        api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkCmpDocBorder', { bg = 'NONE', fg = '#292a29' })
        api.nvim_set_hl(0, 'BlinkSignatureHelp', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkSignatureHelpBorder', { bg = 'NONE', fg = '#292a29' })
        api.nvim_set_hl(0, 'NoicePopupBorder', { fg = '#292a29' })
    end,
})
