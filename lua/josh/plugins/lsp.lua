return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()

      -- set up lspconfig
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup{
            capabilities = capabilities,
          }
        end
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function()
          vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
          vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
          vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
          vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
          vim.keymap.set('n', 'go', ':lua vim.lsp.buf.type_definition()<CR>')
          vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
          vim.keymap.set('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>')

          vim.keymap.set('n', '<leader>l', ':lua vim.lsp.buf.code_action()<CR>')
          vim.keymap.set('n', '<leader>w', function()
            vim.lsp.buf.format { async = true }
          end)
        end,
      })
    end,
  }
}
