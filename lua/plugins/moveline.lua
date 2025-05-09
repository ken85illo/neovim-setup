return {
    'fedepujol/move.nvim',
    config = function()
        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
        vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
        vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
        vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)

        require('move').setup {}
    end,
}
