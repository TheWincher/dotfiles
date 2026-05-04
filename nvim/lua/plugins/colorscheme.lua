return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "dragon", -- 👈 IMPORTANT
        transparent = false,
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
