return {
  {
    'mason-org/mason.nvim',
    dependencies = {
      'mason-org/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)

          -- highlight other references to the symbol under the cursor
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method('textDocument/documentHighlight') then
            local group = vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = false })
            vim.api.nvim_clear_autocmds({ group = group, buffer = args.buf })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              group = group,
              buffer = args.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              group = group,
              buffer = args.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "ts_ls", "zls" },
        -- vim.lsp.enable() every server mason has installed
        automatic_enable = true,
      })
    end,
  }
}
