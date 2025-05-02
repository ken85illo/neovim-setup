return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup {
            ensure_installed = {
                -- Lua {{{
                'lua-language-server',
                'stylua',
                'luacheck', -- Requires luarocks
                'local-lua-debugger-vscode',
                --}}}

                -- Python {{{
                'basedpyright',
                'ruff',
                'debugpy',
                --}}}

                -- C/C++ {{{
                'clangd',
                'clang-format',
                'cpplint',
                'codelldb',
                -- }}}

                -- Java {{{
                'jdtls',
                'java-debug-adapter',
                -- }}}

                -- JSON {{{
                'json-lsp',
                'prettierd',
                'jsonlint',
                --}}}
            },
        }
    end,
}
