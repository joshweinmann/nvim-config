return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require("mason").setup()
      
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

      -- Define custom configurations for specific servers
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
        },
      }

      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "clangd" },
        automatic_installation = true,
        handlers = {
          -- Default handler for servers without custom config
          function(server_name)
            local config = {
              on_attach = on_attach,
              capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }
            
            -- Merge custom config if it exists
            if server_configs[server_name] then
              config = vim.tbl_deep_extend("force", config, server_configs[server_name])
            end
            
            require('lspconfig')[server_name].setup(config)
          end,
        }
      })
    end,
  }
}
