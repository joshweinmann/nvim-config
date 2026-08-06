-- telescope (wrapped so telescope stays lazy instead of loading at startup)
local function tele(picker)
  return function() require('telescope.builtin')[picker]() end
end
vim.keymap.set('n', '<leader>f', tele('find_files'))
vim.keymap.set('n', '<leader>g', tele('live_grep'))
vim.keymap.set('n', '<leader>s', tele('grep_string'))
vim.keymap.set('n', '<leader>b', tele('buffers'))
vim.keymap.set('n', '<leader>d', tele('diagnostics'))
vim.keymap.set('n', '<leader>/', tele('current_buffer_fuzzy_find'))
vim.keymap.set('n', '<leader>?', tele('oldfiles'))
vim.keymap.set('n', '<leader>m', tele('lsp_document_symbols'))
vim.keymap.set('n', '<leader>r', tele('lsp_references'))
vim.keymap.set('n', '<leader>t', tele('git_status'))
vim.keymap.set('n', '<leader>k', tele('keymaps'))

-- nvim's default gr* LSP maps (grn/gra/grr/gri/grt/grx) make our own `gr` wait
-- for 'timeoutlen' before firing, so drop them
for _, lhs in ipairs({ 'grn', 'gra', 'grr', 'gri', 'grt', 'grx' }) do
  pcall(vim.keymap.del, { 'n', 'x' }, lhs)
end

-- nvim-tree
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)

-- change buffers
vim.keymap.set('n', 'gn', vim.cmd.bnext)
vim.keymap.set('n', 'gp', vim.cmd.bprevious)

-- select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>')

-- hide search highlight
vim.keymap.set('n', '<leader>h', vim.cmd.nohlsearch)

-- vertical split
vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)

-- switch between split windows
vim.keymap.set('n', 'gh', '<C-w>h')
vim.keymap.set('n', 'gl', '<C-w>l')
vim.keymap.set('n', 'gj', '<C-w>j')
vim.keymap.set('n', 'gk', '<C-w>k')
