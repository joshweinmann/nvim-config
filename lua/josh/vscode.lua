---- SETTINGS ----
-- map leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- wrap cursor
vim.opt.whichwrap:append('<>[]hl')

-- copy and paste using system clipboard
vim.opt.clipboard = 'unnamedplus'

---- KEYMAPS ----
-- hide search highlight
vim.keymap.set('n', '<leader>h', ':noh<CR>')

-- open file search
vim.keymap.set(
  'n',
  '<leader>f',
  [[<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]]
)

-- toggle sidebar
vim.keymap.set(
  'n',
  '<leader>e',
  [[<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>]]
)

-- global search
vim.keymap.set(
  'n',
  '<leader>g',
  [[<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>]]
)

-- misc
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>') -- select all

---- AUTOCOMMANDS ----
-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
