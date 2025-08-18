-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- format c++ files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.h" },
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent! %!clang-format")
    pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
  end,
})

-- colorscheme
vim.cmd 'colorscheme moonfly'
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" }) -- white border popups
