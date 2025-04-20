local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = true -- Add relative numbers
opt.scrolloff = 10 -- Minimal number of lines until the display scrolls
opt.sidescrolloff = 10 -- Minimal number of columns until the display scrolls 
opt.clipboard = 'unnamedplus' -- Sync with external clipboard
opt.mouse = 'a' -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.signcolumn = 'yes' -- Keep signcolumn on by default
opt.updatetime = 250 -- Decrease update tim
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.undofile = true -- Save undo history
opt.splitright = true -- Open new splits to the right
opt.splitbelow = true -- Open new splits to the bottom
opt.cursorline = true -- Highlight which line we are on
opt.confirm = true -- Shows confirmation whenever exiting without saving
opt.autoindent = true -- Autoindent when starting new line
opt.expandtab = true -- Pressing tab will insert spaces
opt.shiftwidth = 4 -- Spaces inserted for each indentation 
opt.tabstop = 4 -- Insert n spaces for a tab 
opt.softtabstop = 4 -- Spaces that a tab counts
opt.termguicolors = true -- Enable highlight groups
opt.whichwrap = 'bs<>[]hl' -- Allows horizontal keys to move to next line

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
