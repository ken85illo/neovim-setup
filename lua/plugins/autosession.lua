return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        auto_restore = false,
        post_restore_cmds = {
            function()
                -- Safely trigger git-conflict.nvim to scan all buffers loaded by the session
                pcall(function()
                    vim.cmd 'GitConflictRefresh'
                end)
            end,
        },
    },
}
