local km = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

km.set('n', '<leader>', '<Nop>', { desc = 'Leader Keymaps', silent = true }) -- Leader keymap
km.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true }) -- Clear highlights on search when pressing <Esc> in normal mode

-- Open Lazy UI
km.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Open Lazy UI', silent = true })

-- Open Mason UI
km.set('n', '<leader>m', '<cmd>Mason<CR>', { desc = 'Open Mason UI', silent = true })

-- Reveal Neo-tree
km.set('n', '\\', '<cmd>Neotree reveal<CR>', { desc = 'Reveal Neotree', silent = true })

-- Buffer Keymaps
km.set('n', '<leader>b', '<Nop>', { desc = 'Buffer Keymaps', silent = true })
km.set('n', '<S-H>', '<cmd>bp<CR>', { desc = 'Previous Buffer', silent = true })
km.set('n', '<S-L>', '<cmd>bn<CR>', { desc = 'Next Buffer', silent = true })
km.set('n', '<leader>bd', '<cmd>bd! %d|bpCR>', { desc = 'Delete Buffer', silent = true })

-- Tab Keymaps
km.set('n', '<leader><Tab>', '<Nop>', { desc = 'Tabs', silent = true })
km.set('n', '<leader><Tab>p', '<cmd>tabp<CR>', { desc = 'Previous Tab', silent = true })
km.set('n', '<leader><Tab>n', '<cmd>tabn<CR>', { desc = 'Next Tab', silent = true })
km.set('n', '<leader><Tab><Tab>', '<cmd>tabnew<CR>', { desc = 'Next Tab', silent = true })
km.set('n', '<leader><Tab>d', '<cmd>tabclose<CR>', { desc = 'Next Tab', silent = true })

-- Use vim keys as default when manipulating the windows
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
km.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Move focus to the left window' })
km.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Move focus to the right window' })
km.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Move focus to the upper window' })
