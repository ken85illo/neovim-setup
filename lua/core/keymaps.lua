vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

local nmap = function(key, func, desc)
    km.set('n', key, func, { desc = desc, silent = true })
end

nmap('<leader>', '<Nop>', 'Leader Keymaps') -- Leader keymap
nmap('<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
km.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit Terminal Mode', silent = true }) -- Clear highlights on search when pressing <Esc> in normal mode

-- Open Lazy UI
nmap('<leader>l', '<cmd>Lazy<CR>', 'Open Lazy UI')

-- Open Mason UI
nmap('<leader>m', '<cmd>Mason<CR>', 'Open Mason UI')

-- Reveal Neo-tree
nmap('\\', '<cmd>Neotree reveal<CR>', 'Reveal Neotree')

-- Buffer Keymaps
nmap('<leader>b', '<Nop>', 'Buffer Keymaps')
nmap('<S-L>', '<cmd>BufferLineCycleNext<CR>', 'Next Buffer')
nmap('<S-H>', '<cmd>BufferLineCyclePrev<CR>', 'Previous Buffer')
nmap('<leader>bn', '<cmd>BufferLineMoveNext<CR><CR>', 'Move to Next Buffer')
nmap('<leader>bp', '<cmd>BufferLineMovePrev<CR>', 'Move to Previous Buffer')
nmap('<leader>bo', '<cmd>BufferLineCloseOthers<CR>', 'Delete Every Buffer')
nmap('<leader>bd', '<cmd>bn|bd! #<CR>', 'Delete Current Buffer')
nmap('<leader>ba', '<cmd>%bd<CR>', 'Delete Every Buffer')

-- Tab Keymaps
nmap('<leader><Tab>', '<Nop>', 'Tabs')
nmap('<leader><Tab>p', '<cmd>tabp<CR>', 'Previous Tab')
nmap('<leader><Tab>n', '<cmd>tabn<CR>', 'Next Tab')
nmap('<leader><Tab><Tab>', '<cmd>tabnew<CR>', 'Next Tab')
nmap('<leader><Tab>d', '<cmd>tabclose<CR>', 'Close Tab')
nmap('<leader><Tab>a', '<cmd>tabnew<CR>', 'Open New Tab')

-- Use vim keys as default when manipulating the windows
nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Resize window
nmap('<C-Up>', '<cmd>resize +2<CR>', 'Increase Window Size (Horizontal)')
nmap('<C-Down>', '<cmd>resize -2<CR>', 'Decrease Window Size (Horizontal)')
nmap('<C-Left>', '<cmd>vertical resize -2<CR>', 'Decrease Window Size (Vertical)')
nmap('<C-Right>', '<cmd>vertical resize +2<CR>', 'Increase Window Size (Vertical)')

-- Spawn window vertically or horizontally
nmap('|', '<cmd>vsplit<CR>', 'Vertical Split')
nmap('-', '<cmd>split<CR>', 'Horizontal Split')

-- Toggle Inlay Hint
nmap('<F6>', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, 'Toggle Inlay Hints')

-- Diagnostic
nmap('<M-d>', '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open Floating Diagnostic')
