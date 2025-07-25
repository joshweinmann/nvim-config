return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      local cmp = require('cmp')
      local select_opts = {behavior = cmp.SelectBehavior.Select}

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),                 -- open menu
          ['<CR>'] = cmp.mapping.confirm({select = true}),        -- select option
          ['<Down>'] = cmp.mapping.select_next_item(select_opts), -- next option
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),   -- prev option
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' }
        },
          {
            { name = 'buffer' },
          }
        )
      })
    end
  }
}
