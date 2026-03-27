return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      require("mason").setup()

      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Shared on_attach for most servers
      local function on_attach(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)
      end

      -- Configure LSP servers
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
            return lspconfig.util.root_pattern(
              'Makefile', 'configure.in', 'configure.ac', '.git'
            )(fname) or lspconfig.util.path.dirname(fname)
          end,
          on_attach = on_attach,
          capabilities = capabilities,
        },

        ts_ls = {
          on_attach = function(client, bufnr)
            -- Disable formatting from ts_ls to avoid conflicts with Biome
            client.server_capabilities.documentFormattingProvider = false

            -- Keymaps
            on_attach(client, bufnr)

            -- Format on save using Biome CLI
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                local file = vim.fn.expand("%:p")
                local buftext = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")

                local biome_cmd = {
                  "biome", "check", "--write", "--stdin-file-path", file
                }

                local output = vim.fn.systemlist(biome_cmd, buftext)
                local exit_code = vim.v.shell_error

                if exit_code == 0 then
                  local cursor = vim.api.nvim_win_get_cursor(0)
                  pcall(vim.cmd, "undojoin")
                  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output)
                  pcall(vim.api.nvim_win_set_cursor, 0, cursor)
                end
              end,
            })
          end,
          capabilities = capabilities,
        },
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(server_configs),
        automatic_installation = true,
      })

      -- Setup each server
      for server, config in pairs(server_configs) do
        lspconfig[server].setup(config)
      end
    end,
  }
}
