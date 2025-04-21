return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    event = "VimEnter",
    dependencies = {
        {
            'nvim-lua/plenary.nvim'
        },
        {
          "1riz/telescope-macros.nvim",
          config = function()
            require("telescope").load_extension "macros"
          end
        },
    },
    config = function() 
        local actions = require('telescope.actions')
        
        require('telescope').setup{
            defaults = {
                --initial_mode = "normal",
                mappings = {
                  n = {
                    ["q"] = actions.close,
                  },
                },
              }
        }
    end,
}
