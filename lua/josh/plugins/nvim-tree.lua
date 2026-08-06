return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup({
        view = {
          side = 'right',
          -- a table width is adaptive mode: grows to fit the longest name
          width = { min = 30 },
        },
        filters = { dotfiles = false, git_ignored = false },
      })
    end,
  }
}
