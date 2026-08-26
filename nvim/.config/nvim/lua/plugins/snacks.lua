return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
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
