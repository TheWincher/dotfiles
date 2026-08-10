return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          jump = { close = true },
          layout = {
            layout = {
              position = "float", -- popup flottant centré
              backdrop = true,
              width = 0.5,
              height = 0.5,
              border = "rounded",
              title = " Explorer ",
              title_pos = "center",
            },
          },
        },
      },
    },
  },
}
