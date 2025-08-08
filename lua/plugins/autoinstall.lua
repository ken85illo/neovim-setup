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
                'glsl_analyzer',
                -- }}}

                -- Makefile {{{
                'checkmake',
                -- }}}

                -- CMake {{{
                'cmake-language-server',
                'cmakelang',
                'cmakelint',
                -- }}}

                -- Java {{{
                'jdtls',
                'java-debug-adapter',
                -- }}}

                -- JSON {{{
                'json-lsp',
                'prettierd',
                --}}}

                -- WEBDEV {{{
                'html-lsp',
                'css-lsp',
                'typescript-language-server',
                --}}}

                -- Bash {{{
                'bashls',
                'beautysh',
                'shellcheck',
                -- }}}
            },
        }
    end,
}
