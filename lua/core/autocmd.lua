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

-- C/C++ Switch to header/source
autocmd('FileType', {
    pattern = {
        'cpp',
        'hpp',
        'h',
        'c',
    },

    callback = function()
        vim.keymap.set({ 'n', 'i' }, '<M-e>', '<cmd>LspClangdSwitchSourceHeader<CR>', { desc = 'Switch to header/source', buffer = true, silent = true })
    end,
})

-- Disable folds in neo-tree
autocmd('FileType', {
    pattern = { 'neo-tree' },
    callback = function()
        require('ufo').detach()
        vim.opt_local.foldenable = false
    end,
})

-- Make background transparent
autocmd({ 'ColorScheme', 'BufWinEnter', 'WinNew' }, {
    desc = 'Transparent background',
    pattern = '*',
    callback = function()
        api.nvim_set_hl(0, 'WinSeparator', { fg = '#292a29', bold = true }) -- Show Window Borders
        api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' }) -- Transparent Float Windows

        -- Dark Gray Buffer Line
        api.nvim_set_hl(0, 'TabLineFill', { bg = '#141414' })
        api.nvim_set_hl(0, 'TabLine', { bg = '#141414' })

        -- Dark Gray Status Line
        api.nvim_set_hl(0, 'StatusLine', { bg = '#141414' })
        api.nvim_set_hl(0, 'StatusLineNC', { bg = '#141414' })

        -- Remove background for blink doc
        api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkCmpDocBorder', { bg = 'NONE', fg = '#7a7b7d' })
        api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { bg = 'NONE' })
        api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { bg = 'NONE', fg = '#7a7b7d' })
    end,
})
