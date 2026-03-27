-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- colorscheme
vim.cmd 'colorscheme moonfly'
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" }) -- white border popups
