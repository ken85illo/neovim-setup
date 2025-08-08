return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',

        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- NOTE: LSP Stuff
        'mfussenegger/nvim-dap-python',
    },
    keys = {
        {
            '<leader>d',
            '<Nop',
            desc = 'DAP Debugger',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Breakpoint Condition',
        },
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Toggle Breakpoint',
        },
        {
            '<leader>dc',
            function()
                require('dap').continue()
            end,
            desc = 'Run/Continue',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = 'Step Into',
        },
        {
            '<leader>do',
            function()
                require('dap').step_out()
            end,
            desc = 'Step Out',
        },
        {
            '<leader>dp',
            function()
                require('dap').pause()
            end,
            desc = 'Pause',
        },
        {
            '<leader>dt',
            function()
                require('dap').terminate()
            end,
            desc = 'Terminate',
        },
        {
            '<F5>',
            function()
                require('dapui').toggle()
            end,
            desc = 'Debug: See last session result.',
        },
    },

    config = function()
        local home = os.getenv 'HOME' .. '/'
        local dap = require 'dap'

        require('mason').setup()
        require('mason-nvim-dap').setup {
            ensure_installed = {},
            handlers = {},
            automatic_installation = true,
        }
        require('dapui').setup { reset = true }
        require('dap-python').setup(home .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

        dap.adapters.codelldb = {
            type = 'executable',
            command = home .. '.local/share/nvim/mason/packages/codelldb/codelldb',
        }

        dap.configurations.c = {
            {
                name = 'Launch',
                type = 'codelldb',
                request = 'launch',
                program = function() -- Ask the user what executable wants to debug
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/bin/program', 'file')
                end,
                cwd = '${workspaceFolder}/build',
                stopOnEntry = false,
                args = {},
            },
        }

        dap.configurations.cpp = dap.configurations.c
    end,
}
