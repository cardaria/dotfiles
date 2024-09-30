return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  -- tag = "v3.6.0",
  config = function()
    require("cyberdream").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
      theme = {
        variant = "light",
        highlights = {
          CursorLineNr = { fg = "#ff9e64", bold = true },
          MiniFilesBorder = { fg = "#ff9e64" },
          -- Type = { fg = "NONE", bg = "NONE" },
          -- Keyword = { fg = "NONE", bg = "NONE" },
          TelescopeBorder = { fg = "#ff9e64" },
          -- IndentLineCurrent = { fg = "#7b8496" },
          -- MiniIndentscopeSymbol = { fg = "#7b8496" },
        },
      },
    })
    vim.cmd("colorscheme cyberdream") -- set the colorscheme

  end,
}