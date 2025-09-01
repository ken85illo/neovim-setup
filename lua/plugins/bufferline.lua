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
                    bg = '#202020',
                },
                background = {
                    bg = '#202020',
                },
                tab = {
                    bg = '#202020',
                },
                tab_selected = {
                    fg = '#75a5f8',
                    bg = '#202020',
                },
                tab_separator = {
                    bg = '#202020',
                    fg = '#202020',
                },
                tab_separator_selected = {
                    bg = '#202020',
                    fg = '#202020',
                },
                tab_close = {
                    bg = '#202020',
                },
                close_button = {
                    bg = '#202020',
                },
                close_button_visible = {
                    bg = '#202020',
                },
                close_button_selected = {
                    bg = '#202020',
                },
                buffer_visible = {
                    bg = '#202020',
                },
                buffer_selected = {
                    bg = '#202020',
                },
                numbers = {
                    bg = '#202020',
                },
                numbers_visible = {
                    bg = '#202020',
                },
                numbers_selected = {
                    bg = '#202020',
                },
                diagnostic = {
                    bg = '#202020',
                },
                diagnostic_visible = {
                    bg = '#202020',
                },
                diagnostic_selected = {
                    bg = '#202020',
                },
                hint = {
                    bg = '#202020',
                },
                hint_visible = {
                    bg = '#202020',
                },
                hint_selected = {
                    bg = '#202020',
                },
                hint_diagnostic = {
                    bg = '#202020',
                },
                hint_diagnostic_visible = {
                    bg = '#202020',
                },
                hint_diagnostic_selected = {
                    bg = '#202020',
                },
                info = {
                    bg = '#202020',
                },
                info_visible = {
                    bg = '#202020',
                },
                info_selected = {
                    bg = '#202020',
                },
                info_diagnostic = {
                    bg = '#202020',
                },
                info_diagnostic_visible = {
                    bg = '#202020',
                },
                info_diagnostic_selected = {
                    bg = '#202020',
                },
                warning = {
                    bg = '#202020',
                },
                warning_visible = {
                    bg = '#202020',
                },
                warning_selected = {
                    bg = '#202020',
                },
                warning_diagnostic = {
                    bg = '#202020',
                },
                warning_diagnostic_visible = {
                    bg = '#202020',
                },
                warning_diagnostic_selected = {
                    bg = '#202020',
                },
                error = {
                    bg = '#202020',
                },
                error_visible = {
                    bg = '#202020',
                },
                error_selected = {
                    bg = '#202020',
                },
                error_diagnostic = {
                    bg = '#202020',
                },
                error_diagnostic_visible = {
                    bg = '#202020',
                },
                error_diagnostic_selected = {
                    bg = '#202020',
                },
                modified = {
                    bg = '#202020',
                },
                modified_visible = {
                    bg = '#202020',
                },
                modified_selected = {
                    bg = '#202020',
                },
                duplicate_selected = {
                    bg = '#202020',
                },
                duplicate_visible = {
                    bg = '#202020',
                },
                duplicate = {
                    bg = '#202020',
                },
                separator_selected = {
                    bg = '#202020',
                },
                separator_visible = {
                    bg = '#202020',
                },
                separator = {
                    bg = '#202020',
                    fg = '#202020',
                },
                indicator_visible = {
                    bg = '#202020',
                },
                indicator_selected = {
                    bg = '#202020',
                },
                pick_selected = {
                    bg = '#202020',
                },
                pick_visible = {
                    bg = '#202020',
                },
                pick = {
                    bg = '#202020',
                },
                offset_separator = {
                    bg = '#202020',
                },
                trunc_marker = {
                    bg = '#202020',
                },
            },
        }
    end,
}
