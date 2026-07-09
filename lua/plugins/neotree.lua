return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                require('window-picker').setup {
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        bo = {
                            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                            buftype = { 'terminal', 'quickfix' },
                        },
                    },
                }
            end,
        },
    },
    opts = {
        filesystem = {
            use_libuv_file_watcher = true,
            filtered_items = {
                visible = true,
            },
        },
        source_selector = {
            statusline = true,
        },
        window = {
            width = 35,
            mappings = {
                ['\\'] = 'close_window',
            },
        },
    },
    config = function()
        local events = require 'neo-tree.events'

        local function handleTreeEvent()
            local dapui = require 'dapui'

            -- Check if any dapui windows are open
            local dapui_open = false
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local ft = vim.bo[buf].filetype
                if ft and ft:match '^dapui_' then
                    dapui_open = true
                    break
                end
            end

            if dapui_open then
                dapui.open { reset = true }
            end
        end

        events.subscribe {
            event = events.NEO_TREE_WINDOW_AFTER_CLOSE,
            handler = handleTreeEvent,
        }
    end,
}
