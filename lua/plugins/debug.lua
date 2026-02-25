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
            '<leader>dk',
            function()
                require('dapui').eval()
            end,
            desc = 'Evaluate expression',
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
        local dapui = require 'dapui'

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        require('mason').setup()
        require('mason-nvim-dap').setup {
            ensure_installed = {},
            handlers = {},
            automatic_installation = true,
        }
        require('dapui').setup { reset = true }
        require('dap-python').setup(home .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = home .. '/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
        }

        dap.configurations.cpp = {
            {
                name = 'Launch file',
                type = 'cppdbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = false,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'enable pretty printing',
                        ignoreFailures = false,
                    },
                },
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'enable pretty printing',
                        ignoreFailures = false,
                    },
                },
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

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
