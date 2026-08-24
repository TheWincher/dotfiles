return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    require("easy-dotnet").setup({
      lsp = {
        enabled = true, -- Active Roslyn LSP intégré
        preload_roslyn = true, -- Démarre Roslyn au lancement
      },
    })
  end,
}
