return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-neotest/neotest-jest',
    },

    keys = {
        {
            '<leader>t',
            '<Nop>',
            desc = 'Neotest',
        },
        {
            '<leader>tn',
            function()
                require('neotest').run.run()
            end,
            desc = 'Run the nearest test',
        },
        {
            '<leader>tf',
            function()
                require('neotest').run.run(vim.fn.expand '%')
            end,
            desc = 'Run the current file',
        },
        {
            '<leader>tg',
            function()
                require('neotest').run.run { strategy = 'dap' }
            end,
            desc = 'Debug the nearest test ',
        },
        {
            '<leader>to',
            function()
                require('neotest').output.open()
            end,
            desc = 'Open test output',
        },
        {
            '<leader>ts',
            function()
                require('neotest').summary.toggle()
            end,
            desc = 'Toggle summary',
        },
        {
            '<leader>ta',
            function()
                require('neotest').run.attach()
            end,
            desc = 'Attach to the nearest test',
        },
        {
            '<leader>th',
            function()
                require('neotest').watch.toggle(vim.fn.expand '%')
            end,
            desc = 'Toggle watch on current file',
        },
    },
    config = function()
        require('neotest').setup {
            diagnostic = {
                enabled = true,
            },
            floating = {
                border = 'rounded',
            },
            adapters = {
                require 'neotest-jest' {
                    jestCommand = 'npx jest',
                    jestArguments = function(defaultArguments, _)
                        return defaultArguments
                    end,
                    jestConfigFile = 'custom.jest.config.ts',
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fs.root(path, 'package.json')
                    end,
                    isTestFile = require('neotest-jest.jest-util').defaultIsTestFile,
                },
            },
        }
    end,
}
