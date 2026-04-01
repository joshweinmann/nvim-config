return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters = {
          biome = {
            command = '/opt/homebrew/bin/biome',
            args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
            stdin = true,
          },
        },
        formatters_by_ft = {
          typescript = { "biome" },
          javascript = { "biome" },
          typescriptreact = { "biome" },
          javascriptreact = { "biome" },
          json = { "biome" },
          html = { "biome" },
          css = { "biome" },
        },
        format_on_save = {
          timeout_ms = 500,
          -- lsp_format = "fallback",
        }
      })
    end,
  }
}
