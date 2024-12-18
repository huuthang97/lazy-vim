return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark", -- Options: dark, darker, cool, deep, warm, warmer
        transparent = true,
        term_colors = true,
        ending_tildes = false,
      })
      vim.cmd("colorscheme onedark")
    end,
  },
}
