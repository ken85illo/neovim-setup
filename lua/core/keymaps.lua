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

-- [[Telescope Keymaps]]
km.set('n', '<leader>s', '<Nop>', { desc = 'Search Telescope', silent = true })
km.set('n', '<leader><leader>', '<cmd>Telescope buffers<CR>', { desc = 'Telescope Buffers', silent = true })
km.set('n', '<leader>sf', '<cmd>Telescope find_files<CR>', { desc = 'Files', silent = true })
km.set('n', '<leader>sg', '<cmd>Telescope grep_string<CR>', { desc = 'Live Grep', silent = true })
km.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>', { desc = 'Tags', silent = true })
km.set('n', '<leader>s/', '<cmd>Telescope search_history<CR>', { desc = 'History', silent = true })
km.set('n', '<leader>sa', '<cmd>Telescope autocommands<CR>', { desc = 'Autocmds', silent = true })
km.set('n', '<leader>s"', '<cmd>Telescope registers <CR>', { desc = 'Registers', silent = true })
km.set('n', "<leader>s'", '<cmd>Telescope marks <CR>', { desc = 'Registers', silent = true })
km.set('n', '<leader>sk', '<cmd>Telescope keymaps<CR>', { desc = 'Keymaps', silent = true })
km.set('n', '<leader>sc', '<cmd>Telescope highlights<CR>', { desc = 'Highlights', silent = true })
km.set('n', '<leader>sn', '<cmd>Telescope notify<CR>', { desc = 'Notifications', silent = true })
km.set('n', '<leader>s@', '<cmd>Telescope macros<CR>', { desc = 'Macros', silent = true })
km.set('n', '<leader>s:', '<cmd>Telescope commands<CR>', { desc = 'Commands', silent = true })
km.set('n', '<leader>sm', '<cmd>Telescope man_pages<CR>', { desc = 'Man Pages', silent = true })

-- Use vim keys as default when manipulating the windows
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
