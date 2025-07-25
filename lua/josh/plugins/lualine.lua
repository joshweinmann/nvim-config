return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        theme = 'moonfly',
        component_separators = '|',
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_x = {'filetype'},
      },
    },
  }
}
