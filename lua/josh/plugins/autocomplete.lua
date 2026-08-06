return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
      keymap = {
        preset = 'default',
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        -- preselect the first entry so <CR> accepts it without arrowing down
        list = { selection = { preselect = true, auto_insert = false } },
        menu = { border = 'rounded' },
        documentation = { auto_show = true, window = { border = 'rounded' } },
      },
      signature = { enabled = true, window = { border = 'rounded' } },
      sources = { default = { 'lsp', 'path', 'buffer' } },
    },
  }
}
