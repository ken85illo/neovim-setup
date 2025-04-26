require 'core.options'
require 'core.keymaps'
require 'core.autocmd'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- See :h lazy.nvim-plugin-spec
require('lazy').setup {
    spec = {
        { import = 'plugins' }, -- Import lua files inside plugins folder
    },
    ui = {
        border = 'rounded',
        size = {
            width = 0.8,
            height = 0.8,
        },
    },
    checker = { enabled = true },
}
