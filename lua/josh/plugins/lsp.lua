return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls" },
        automatic_installation = true,
      })

      -- LSP keybindings when LSP attaches to a buffer
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>w', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      -- Setup TypeScript server
      require('lspconfig').ts_ls.setup({
        on_attach = on_attach,
      })
    end,
  }
}
