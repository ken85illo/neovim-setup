local home = os.getenv 'HOME'
local jdtls = require 'jdtls'
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
local mason_packages_path = home .. '/.local/share/nvim/mason/packages/'
local jdtls_path = mason_packages_path .. 'jdtls/'

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints'

local on_attach = function()
    vim.api.nvim_set_keymap('n', '<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { noremap = true, silent = true })

    vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
        callback = function()
            vim.lsp.inlay_hint.enable(true, nil)
        end,
    })
    vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
        callback = function()
            vim.lsp.inlay_hint.enable(false, nil)
        end,
    })
end

local bundles = {
    vim.fn.glob(mason_packages_path .. 'java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', true),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(mason_packages_path .. 'java-test/extension/server/*.jar', true), '\n'))

local config = {
    on_attach = on_attach,
    cmd = {
        'java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        '-jar',
        vim.fn.glob(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar', true),
        '-configuration',
        jdtls_path .. 'config_linux/',

        -- 💀
        '-data',
        workspace_dir,
    },

    -- root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),
    root_dir = vim.fn.getcwd(),

    settings = {
        java = {
            edit = { smartSemiColon = { enabled = true } },
            quickfix = { showAt = true },
            implementationCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            format = { enabled = true },
            references = { includeDecompiledSources = true },
            saveActions = { organizeImports = false },
            signatureHelp = { enabled = true, description = { enabled = true } },
            inlayHints = {
                parameterNames = {
                    enabled = 'all', -- literals, all, none
                },
            },
        },
    },

    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
        bundles = bundles,
    },
}

jdtls.start_or_attach(config)
