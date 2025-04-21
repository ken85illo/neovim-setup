return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VimEnter",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
    opts = {
      source_selector = {
        statusline = true,
      }

    },
}
