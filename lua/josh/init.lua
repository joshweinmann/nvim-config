vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.vscode then
  require 'josh.vscode'
else
  require 'josh.settings'
  require 'josh.lazy'
  require 'josh.keymaps'
  require 'josh.autocommands'
end
