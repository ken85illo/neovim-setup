return {
    {
        'kevinhwang91/nvim-ufo',
        event = 'VeryLazy',
        dependencies = 'kevinhwang91/promise-async',
        keys = {
            {
                'zR',
                function()
                    require('ufo').openAllFolds()
                end,
                desc = 'Open All Folds',
            },
            {
                'zM',
                function()
                    require('ufo').closeAllFolds()
                end,
                desc = 'Close All Folds',
            },
            {
                'zr',
                function()
                    require('ufo').openFoldsExceptKinds()
                end,
                desc = 'Open Folds Except Kinds',
            },
            {
                'zm',
                function()
                    require('ufo').closeFoldsWith()
                end,
                desc = 'Open Folds Except Kinds',
            },
            {
                'K',
                function()
                    local winid = require('ufo').peekFoldedLinesUnderCursor()
                    if not winid then
                        vim.lsp.buf.hover()
                    end
                end,
            },
        },
        init = function()
            vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }%*'
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        config = function()
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local totalLines = vim.api.nvim_buf_line_count(0)
                local foldedLines = endLnum - lnum
                local suffix = (' 󰁂 %d %d%%'):format(foldedLines, foldedLines / totalLines * 100)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                local rAlignAppndx = math.max(math.min(vim.opt.textwidth['_value'], width - 1) - curWidth - sufWidth, 0)
                suffix = (' '):rep(rAlignAppndx) .. suffix
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end

            require('ufo').setup {
                open_fold_hl_timeout = 150,
                close_fold_kinds_for_ft = {
                    default = { 'imports', 'comment' },
                    json = { 'array' },
                    c = { 'comment', 'region' },
                },
                close_fold_current_line_for_ft = {
                    default = true,
                    c = false,
                },
                preview = {
                    win_config = {
                        border = { '', '─', '', '', '', '─', '', '' },
                        winhighlight = 'Normal:Folded',
                        winblend = 0,
                    },
                    mappings = {
                        scrollD = '<C-d>',
                        scrollU = '<C-u>',
                        jumpTop = '[',
                        jumpBot = ']',
                    },
                },
                fold_virt_text_handler = handler,
            }
        end,
    },
}
