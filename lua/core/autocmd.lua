local api = vim.api

-- Display a highlight when yanking text
api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.highlight.on_yank()
    end,
})
