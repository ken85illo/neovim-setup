return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup {
            ensure_installed = {
                -- Lua {{{
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
                'cmakelint',
                -- }}}

                -- Java {{{
                -- 'jdtls',
                'java-debug-adapter',
                -- }}}

                -- JSON {{{
                'json-lsp',
                'prettier',
                --}}}

                -- WEBDEV {{{
                'html-lsp',
                'css-lsp',
                'typescript-language-server',
                'emmet-language-server',
                'tailwindcss-language-server',
                'cssmodules-language-server',
                'css-variables-language-server',
                'firefox-debug-adapter',
                --}}}

                -- Bash {{{
                'bashls',
                'beautysh',
                'shellcheck',
                -- }}}

                -- CSharp {{{
                'roslyn',
                'csharpier',
                'netcoredbg',
                -- }}}

                -- GDScript {{{
                'gdtoolkit',
                -- }}}
            },
        }
    end,
}
