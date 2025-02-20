-- hide search highlight
vim.keymap.set('n', '<leader>h', ':noh<CR>')

-- change buffers
vim.keymap.set('n', 'gn', ':bn<CR>')
vim.keymap.set('n', 'gp', ':bp<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>s', builtin.grep_string)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>d', builtin.diagnostics)
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>?', builtin.oldfiles)

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- formatting
vim.keymap.set('n', '<leader>bi', ':silent !biome format --write %<CR>:edit!<CR>', { silent = true })

-- misc
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>')    -- select all
vim.keymap.set('n', '<leader>i', ':e ~/.config/nvim/init.lua<CR>') -- open init.lua
