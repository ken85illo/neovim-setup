local api = vim.api

-- Display a highlight when yanking text
api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Disable neo-tree when leaving (it conflicts with persistence)
api.nvim_create_autocmd('VimLeavePre', {
   desc = 'Disable neo-tree and save persistence',
   callback = function()
       vim.cmd("Neotree close <CR>")
       require("persistence").save()
   end,
})
