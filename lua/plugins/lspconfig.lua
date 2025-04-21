return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                -- Lua
                "lua_ls",
            }
        }

        -- [[Setups for LSPs]]
        require'lspconfig'.lua_ls.setup{}
    end,
}
