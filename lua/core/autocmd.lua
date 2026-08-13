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
        '^dap',
        'neotest-output',
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
autocmd('BufEnter', {
    callback = function()
        if vim.bo.filetype == 'neo-tree' or vim.bo.filetype == 'toggleterm' or vim.bo.filetype:match '^dap' then
            vim.wo.statuscolumn = ' '
            vim.wo.signcolumn = 'no'
        end
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    callback = function()
        vim.b.copilot_suggestion_hidden = true
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuClose',
    callback = function()
        vim.b.copilot_suggestion_hidden = false
    end,
})

--  Tresitter bullshit
vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        local available_langs = require('nvim-treesitter').get_available()
        local is_available = vim.tbl_contains(available_langs, lang)
        if is_available then
            local installed_langs = require('nvim-treesitter').get_installed()
            local installed = vim.tbl_contains(installed_langs, lang)
            if not installed then
                require('nvim-treesitter').install(lang):wait()
            end
            vim.treesitter.start()
            require('nvim-treesitter').indentexpr()
        end
    end,
})

-- Make background transparent
-- autocmd({ 'ColorScheme', 'BufWinEnter', 'WinNew' }, {
--     desc = 'Transparent background',
--     pattern = '*',
--     callback = function()
--         api.nvim_set_hl(0, 'WinSeparator', { fg = '#292a29', bold = true }) -- Show Window Borders
--         api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' }) -- Transparent Float Windows
--
--         -- Dark Gray Buffer Line
--         api.nvim_set_hl(0, 'TabLineFill', { bg = '#202020' })
--         api.nvim_set_hl(0, 'TabLine', { bg = '#202020' })
--         api.nvim_set_hl(0, 'BufferLine', { bg = '#202020' })
--         api.nvim_set_hl(0, 'BufferLineFill', { bg = '#202020' })
--
--         -- Dark Gray Status Line
--         api.nvim_set_hl(0, 'StatusLine', { bg = '#202020' })
--         api.nvim_set_hl(0, 'StatusLineNC', { bg = '#202020' })
--
--         -- Remove background for blink doc
--         api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = 'NONE' })
--         api.nvim_set_hl(0, 'BlinkCmpDocBorder', { bg = 'NONE', fg = '#7a7b7d' })
--         api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { bg = 'NONE' })
--         api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { bg = 'NONE', fg = '#7a7b7d' })
--     end,
-- })
