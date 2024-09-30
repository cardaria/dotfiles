require("cardaria.core")
require("cardaria.lazy")

-- Define a custom highlight group for yank
vim.api.nvim_set_hl(0, 'YankHighlight', {bg = '#fdff7f', bold = false})

-- Highlight text on yank using the custom highlight group
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 200 })
  end,
}) 
