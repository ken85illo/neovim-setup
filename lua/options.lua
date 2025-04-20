-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = true -- Add relative numbers
opt.scrolloff = 10 -- Minimal number of lines until the display scrolls
opt.clipboard = 'unnamedplus' -- Sync with external clipboard
opt.mouse = 'a' -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.signcolumn = 'yes' -- Keep signcolumn on by default
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.undofile = true -- Save undo history
opt.splitright = true -- Open new splits to the right
opt.splitbelow = true -- Open new splits to the bottom
opt.cursorline = true -- Highlight which line we are on
opt.confirm = true -- Shows confirmation whenever exiting without saving

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
