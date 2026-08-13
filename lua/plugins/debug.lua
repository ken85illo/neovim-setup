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
            '<leader>dl',
            function()
                require('dap').run_last()
            end,
            desc = 'Run/Continue Last Session',
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
                require('dapui').toggle { reset = true }
            end,
            desc = 'Debug: See last session result.',
        },
    },
    config = function()
        local home = os.getenv 'HOME' .. '/'
        local dap = require 'dap'
        local dapui = require 'dapui'

        dap.listeners.before.attach.dapui_config = function()
            dapui.open { reset = true }
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open { reset = true }
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
                args = function()
                    local args_string = vim.fn.input 'Arguments: '
                    return vim.split(args_string, ' ')
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

        dap.adapters['pwa-node'] = {
            type = 'server',
            host = 'localhost',
            port = '${port}',
            executable = {
                command = 'node',
                args = { home .. '/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
            },
        }

        local js_config = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file (Node)',
                program = '${file}',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach by Process (Node)',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
                restart = true,
                sourceMaps = true,
                trace = true,
                timeout = 5000, -- Gives up and resets if stuck for 5s
                terminateOnDisconnect = true, -- Kills the dead debug session
            },
            {
                name = 'Debug with Firefox (Launch)',
                type = 'firefox',
                request = 'launch',
                restart = true,
                reAttach = true,
                url = function()
                    return vim.fn.input('Enter Launch URL: ', 'http://localhost:8080')
                end,
                webRoot = '${workspaceFolder}',
                firefoxExecutable = '/usr/bin/firefox',
            },
            {
                name = 'Debug with Firefox (Attach)',
                type = 'firefox',
                request = 'attach',
            },
        }

        dap.configurations.javascript = js_config
        dap.configurations.typescript = js_config
        dap.configurations.typescriptreact = js_config
        dap.configurations.javascriptreact = js_config
    end,
}
