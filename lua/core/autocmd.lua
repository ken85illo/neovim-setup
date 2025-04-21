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

-- More efficient quitting method when opening temporary windows
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man", "qf", "lspinfo", "checkhealth", "spectre_panel" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", {buffer = true, silent = true })
  end,
})

-- Make background transparent
api.nvim_create_autocmd({ "ColorScheme", "BufWinEnter", "WinNew"}, {
    desc = "Fix all backgrounds",
    callback = function()
        api.nvim_set_hl(0, "WinSeparator", { fg = "#27354c" }) -- Show Window Borders
        api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- Transparent Float Windows
    end,
})

