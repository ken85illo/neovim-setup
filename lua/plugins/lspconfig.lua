return {
    'mfussenegger/nvim-jdtls', -- Java
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
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
                },
                clangd = {
                    cmd = { 'clangd', '--header-insertion=never' },
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
                ensure_installed = {},
                automatic_installation = true,
            }

            -- [[Setups for LSPs]]
            -- Automatically add other installed LSPs
            local installed_lsps = {}
            for _, pkg in ipairs(require('mason-registry').get_installed_packages()) do
                if pkg.spec.categories[1] == 'LSP' then
                    installed_lsps[pkg.name] = {}
                end
            end
            installed_lsps['jdtls'] = nil -- Exclude JDTLS (nvim-jdtls already installed)

            local all_lsps = vim.tbl_extend('keep', opts.servers, installed_lsps)
            for server, config in pairs(all_lsps) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities or {})
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end
        end,
    },
}
