-- map leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- turn on termial color
vim.opt.termguicolors = true

-- don't wrap lines
vim.wo.wrap = false

-- convert tabs to spaces
vim.opt.expandtab = true

-- shift around size of indent
vim.opt.shiftwidth = 2

-- wrap cursor
vim.opt.whichwrap:append('<>[]hl')

-- auto switch case-sensitive search
vim.opt.smartcase = true

-- show line numbers
vim.opt.number = true

-- show relative line numbers
vim.opt.relativenumber = true

-- show 4 lines above/below cursor
vim.opt.scrolloff = 4

-- highlight current row
vim.opt.cursorline = true

-- line at 80th column
vim.opt.colorcolumn = '80'

-- show sign column
vim.opt.signcolumn = 'yes'

-- hide ~ after end of buffer
vim.opt.fillchars:append('eob: ')

-- don't show mode in default statusbar
vim.opt.showmode = false

-- customize menu for autocomplete
vim.opt.wildmode = 'list,full'

-- copy and paste using system clipboard
vim.opt.clipboard = 'unnamedplus'

-- don't create swapfile
vim.opt.swapfile = false

-- use persistent undo file
vim.opt.undofile = true

-- where to save undo file
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo')

