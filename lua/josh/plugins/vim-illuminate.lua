return {
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        filetypes_denylist = {'NvimTree'},
        under_cursor = false,
      })
    end,
  }
}
