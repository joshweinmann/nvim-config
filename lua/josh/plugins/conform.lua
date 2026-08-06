return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = 'ConformInfo',
    config = function()
      require("conform").setup({
        -- these all use conform's built-in definitions; anything not listed
        -- here falls back to the language server's own formatter
        formatters_by_ft = {
          rust = { 'rustfmt' },
          c = { 'clang_format' },
          cpp = { 'clang_format' },
          go = { 'gofmt' },
          zig = { 'zigfmt' },
        },
        default_format_opts = { lsp_format = 'fallback' },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        },
      })
    end,
  }
}
