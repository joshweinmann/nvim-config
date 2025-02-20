return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          offsets = {{
            filetype = 'NvimTree',
            text = 'VIM',
            separator = true,
            text_align = 'center',
          }},
        },
      })
    end,
  }
}
