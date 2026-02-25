return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:mason-org/mason-registry',
                        'github:Crashdummyy/mason-registry',
                    },
                },
            },
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-jdtls', -- Java
        },
        opts = {
            -- LSPs configuration goes here
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                        },
                    },
                },
                basedpyright = {
                    root_dir = vim.fn.getcwd(),
                    settings = {
                        basedpyright = {
                            typeCheckingMode = 'standard',
                        },
                    },
                },
                clangd = {
                    cmd = { 'clangd', '--header-insertion=never' },
                },
                html = {
                    root_dir = vim.fn.getcwd(),
                    filetypes = { 'html', 'templ', 'cshtml', 'razor' },
                },
                css_ls = {
                    root_dir = vim.fn.getcwd(),
                },
                ts_ls = {
                    root_dir = vim.fn.getcwd(),
                },
                emmet_language_server = {
                    root_dir = vim.fn.getcwd(),
                    filetypes = {
                        'astro',
                        'css',
                        'eruby',
                        'html',
                        'htmlangular',
                        'htmldjango',
                        'javascriptreact',
                        'less',
                        'pug',
                        'sass',
                        'scss',
                        'svelte',
                        'templ',
                        'typescriptreact',
                        'vue',
                        'cshtml',
                        'razor',
                    },
                },
                gdscript = {
                    name = 'godot',
                    cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
                },
                roslyn = {
                    offset_encoding = 'utf-8',
                    settings = {
                        ['csharp|inlay_hints'] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        },
                        ['csharp|code_lens'] = {
                            dotnet_enable_references_code_lens = true,
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            -- [[Set-up using LSP Zero]]
            -- See https://lsp-zero.netlify.app/docs/tutorial.html

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local options = { buffer = event.buf }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', options)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', options)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', options)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', "<cmd>lua require('conform').format()<cr>", options)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)
                end,
            })

            -- mason lspconfig setup
            require('mason').setup {
                ui = {
                    border = 'rounded',
                    size = {
                        width = 0.8,
                        height = 0.8,
                    },
                },
            }

            require('mason-lspconfig').setup {
                automatic_enable = true,
            }

            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
            end
        end,
    },
}
