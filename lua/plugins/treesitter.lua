return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },

                sync_install = false,
                auto_install = true,
                ignore_install = { 'javascript' },

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
    {
        'Badhi/nvim-treesitter-cpp-tools',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = function()
            local km = vim.keymap
            km.set('n', '<leader>c', '<Nop>', { desc = 'Treesitter CPP', silent = true })
            km.set('n', '<leader>cf', ':TSCppDefineClassFunc<CR>', { desc = 'Create class definition (Tab to accept)', silent = true })
            km.set('v', '<leader>cf', ":'<,'>TSCppDefineClassFunc<CR>", { desc = 'Create class definition (Tab to accept)', silent = true })

            local options = {
                preview = {
                    quit = 'q', -- optional keymapping for quit preview
                    accept = '<tab>', -- optional keymapping for accept preview
                },
                header_extension = 'h', -- optional
                source_extension = 'cpp', -- optional
                custom_define_class_function_commands = { -- optional
                    TSCppImplWrite = {
                        output_handle = require('nt-cpp-tools.output_handlers').get_add_to_cpp(),
                    },
                },
            }
            return options
        end,
    },
}
