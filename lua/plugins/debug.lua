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
            '<Nop>',
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
            '<leader>dn',
            function()
                require('dap').step_over()
            end,
            desc = 'Step Over',
        },
        {
            '<leader>dp',
            function()
                require('dap').pause()
            end,
            desc = 'Pause',
        },
        {
            '<leader>dr',
            function()
                require('dap').restart()
            end,
            desc = 'Restart',
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

        dap.adapters.godot = {
            type = 'server',
            host = '127.0.0.1',
            port = 6006,
        }

        dap.configurations.gdscript = {
            {
                type = 'godot',
                request = 'launch',
                name = 'Launch scene',
                project = '${workspaceFolder}',
            },
        }

        dap.adapters.coreclr = {
            type = 'executable',
            command = home .. '/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
            args = { '--interpreter=vscode' },
        }

        dap.configurations.cs = {
            {
                type = 'coreclr',
                name = 'launch - netcoredbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }

        dap.adapters.firefox = {
            type = 'executable',
            command = 'node',
            args = { home .. '/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js' },
        }

        local firefox_config = {
            name = 'Debug with Firefox',
            type = 'firefox',
            request = 'launch',
            reAttach = true,
            url = 'http://localhost:8080',
            webRoot = '${workspaceFolder}',
            firefoxExecutable = '/usr/bin/firefox',
        }

        dap.configurations.javascript = { firefox_config }
        dap.configurations.typescript = { firefox_config }
    end,
}
