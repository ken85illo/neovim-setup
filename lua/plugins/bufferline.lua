return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup {
            options = {
                diagnostics = 'nvim_lsp',
                tab_size = 0,
                close_command = 'bd! %d|bp',
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
                    bg = 'none',
                },
                background = {
                    bg = 'none',
                },
                tab = {
                    bg = 'none',
                },
                tab_selected = {
                    fg = '#75a5f8',
                    bg = 'none',
                },
                tab_separator = {
                    bg = 'none',
                    fg = '#0c0c0c',
                },
                tab_separator_selected = {
                    bg = 'none',
                    fg = '#0c0c0c',
                },
                tab_close = {
                    bg = 'none',
                },
                close_button = {
                    bg = 'none',
                },
                close_button_visible = {
                    bg = 'none',
                },
                close_button_selected = {
                    bg = 'none',
                },
                buffer_visible = {
                    bg = 'none',
                },
                buffer_selected = {
                    bg = 'none',
                },
                numbers = {
                    bg = 'none',
                },
                numbers_visible = {
                    bg = 'none',
                },
                numbers_selected = {
                    bg = 'none',
                },
                diagnostic = {
                    bg = 'none',
                },
                diagnostic_visible = {
                    bg = 'none',
                },
                diagnostic_selected = {
                    bg = 'none',
                },
                hint = {
                    bg = 'none',
                },
                hint_visible = {
                    bg = 'none',
                },
                hint_selected = {
                    bg = 'none',
                },
                hint_diagnostic = {
                    bg = 'none',
                },
                hint_diagnostic_visible = {
                    bg = 'none',
                },
                hint_diagnostic_selected = {
                    bg = 'none',
                },
                info = {
                    bg = 'none',
                },
                info_visible = {
                    bg = 'none',
                },
                info_selected = {
                    bg = 'none',
                },
                info_diagnostic = {
                    bg = 'none',
                },
                info_diagnostic_visible = {
                    bg = 'none',
                },
                info_diagnostic_selected = {
                    bg = 'none',
                },
                warning = {
                    bg = 'none',
                },
                warning_visible = {
                    bg = 'none',
                },
                warning_selected = {
                    bg = 'none',
                },
                warning_diagnostic = {
                    bg = 'none',
                },
                warning_diagnostic_visible = {
                    bg = 'none',
                },
                warning_diagnostic_selected = {
                    bg = 'none',
                },
                error = {
                    bg = 'none',
                },
                error_visible = {
                    bg = 'none',
                },
                error_selected = {
                    bg = 'none',
                },
                error_diagnostic = {
                    bg = 'none',
                },
                error_diagnostic_visible = {
                    bg = 'none',
                },
                error_diagnostic_selected = {
                    bg = 'none',
                },
                modified = {
                    bg = 'none',
                },
                modified_visible = {
                    bg = 'none',
                },
                modified_selected = {
                    bg = 'none',
                },
                duplicate_selected = {
                    bg = 'none',
                },
                duplicate_visible = {
                    bg = 'none',
                },
                duplicate = {
                    bg = 'none',
                },
                separator_selected = {
                    bg = 'none',
                },
                separator_visible = {
                    bg = 'none',
                },
                separator = {
                    bg = 'none',
                    fg = '#0c0c0c',
                },
                indicator_visible = {
                    bg = 'none',
                },
                indicator_selected = {
                    bg = 'none',
                },
                pick_selected = {
                    bg = 'none',
                },
                pick_visible = {
                    bg = 'none',
                },
                pick = {
                    bg = 'none',
                },
                offset_separator = {
                    bg = 'none',
                },
                trunc_marker = {
                    bg = 'none',
                },
            },
        }
    end,
}
