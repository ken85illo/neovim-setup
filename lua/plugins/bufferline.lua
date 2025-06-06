return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup {
            options = {
                diagnostics = 'nvim_lsp',
                tab_size = 0,
                close_command = 'bd! %d',
                indicator = {
                    style = 'none',
                },
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        separator = false,
                    },
                },
            },
            highlights = {
                fill = {
                    bg = '#141414',
                },
                background = {
                    bg = '#141414',
                },
                tab = {
                    bg = '#141414',
                },
                tab_selected = {
                    fg = '#75a5f8',
                    bg = '#141414',
                },
                tab_separator = {
                    bg = '#141414',
                    fg = '#141414',
                },
                tab_separator_selected = {
                    bg = '#141414',
                    fg = '#141414',
                },
                tab_close = {
                    bg = '#141414',
                },
                close_button = {
                    bg = '#141414',
                },
                close_button_visible = {
                    bg = '#141414',
                },
                close_button_selected = {
                    bg = '#141414',
                },
                buffer_visible = {
                    bg = '#141414',
                },
                buffer_selected = {
                    bg = '#141414',
                },
                numbers = {
                    bg = '#141414',
                },
                numbers_visible = {
                    bg = '#141414',
                },
                numbers_selected = {
                    bg = '#141414',
                },
                diagnostic = {
                    bg = '#141414',
                },
                diagnostic_visible = {
                    bg = '#141414',
                },
                diagnostic_selected = {
                    bg = '#141414',
                },
                hint = {
                    bg = '#141414',
                },
                hint_visible = {
                    bg = '#141414',
                },
                hint_selected = {
                    bg = '#141414',
                },
                hint_diagnostic = {
                    bg = '#141414',
                },
                hint_diagnostic_visible = {
                    bg = '#141414',
                },
                hint_diagnostic_selected = {
                    bg = '#141414',
                },
                info = {
                    bg = '#141414',
                },
                info_visible = {
                    bg = '#141414',
                },
                info_selected = {
                    bg = '#141414',
                },
                info_diagnostic = {
                    bg = '#141414',
                },
                info_diagnostic_visible = {
                    bg = '#141414',
                },
                info_diagnostic_selected = {
                    bg = '#141414',
                },
                warning = {
                    bg = '#141414',
                },
                warning_visible = {
                    bg = '#141414',
                },
                warning_selected = {
                    bg = '#141414',
                },
                warning_diagnostic = {
                    bg = '#141414',
                },
                warning_diagnostic_visible = {
                    bg = '#141414',
                },
                warning_diagnostic_selected = {
                    bg = '#141414',
                },
                error = {
                    bg = '#141414',
                },
                error_visible = {
                    bg = '#141414',
                },
                error_selected = {
                    bg = '#141414',
                },
                error_diagnostic = {
                    bg = '#141414',
                },
                error_diagnostic_visible = {
                    bg = '#141414',
                },
                error_diagnostic_selected = {
                    bg = '#141414',
                },
                modified = {
                    bg = '#141414',
                },
                modified_visible = {
                    bg = '#141414',
                },
                modified_selected = {
                    bg = '#141414',
                },
                duplicate_selected = {
                    bg = '#141414',
                },
                duplicate_visible = {
                    bg = '#141414',
                },
                duplicate = {
                    bg = '#141414',
                },
                separator_selected = {
                    bg = '#141414',
                },
                separator_visible = {
                    bg = '#141414',
                },
                separator = {
                    bg = '#141414',
                    fg = '#141414',
                },
                indicator_visible = {
                    bg = '#141414',
                },
                indicator_selected = {
                    bg = '#141414',
                },
                pick_selected = {
                    bg = '#141414',
                },
                pick_visible = {
                    bg = '#141414',
                },
                pick = {
                    bg = '#141414',
                },
                offset_separator = {
                    bg = '#141414',
                },
                trunc_marker = {
                    bg = '#141414',
                },
            },
        }
    end,
}
