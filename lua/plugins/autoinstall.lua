return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup {
            ensure_installed = {
                -- Lua {{{
                'lua-language-server',
                'stylua',
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
                'codelldb',
                -- }}}

                -- Makefile {{{
                'checkmake',
                -- }}}

                -- CMake {{{
                'cmake-language-server',
                'cmakelang',
                -- }}}

                -- Java {{{
                'jdtls',
                'java-debug-adapter',
                -- }}}

                -- JSON {{{
                'json-lsp',
                'prettierd',
                --}}}
            },
        }
    end,
}
