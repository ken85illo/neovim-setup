local km = vim.keymap

km.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode

-- Use vim keys as default when manipulating the windows
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
km.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
km.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
km.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
km.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
