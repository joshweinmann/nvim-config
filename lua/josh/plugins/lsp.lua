return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    event = { "BufReadPre", "BufNewFile" }, -- ensures proper load timing
    config = function()
      require("mason").setup()

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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local server_configs = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          root_dir = function(fname)
            return require('lspconfig.util').root_pattern(
              'Makefile',
              'configure.in',
              'configure.ac',
              '.git'
            )(fname) or require('lspconfig.util').path.dirname(fname)
          end,
          on_attach = on_attach,
          capabilities = capabilities,
        },
        ts_ls = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      }

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "ts_ls" },
        automatic_installation = true,
      })

      for server, config in pairs(server_configs) do
        require('lspconfig')[server].setup(config)
      end
    end,
  }
}
