-- needs the tree-sitter CLI on PATH: `:MasonInstall tree-sitter-cli`
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua',
        'markdown', 'markdown_inline', 'python', 'rust', 'toml', 'tsx',
        'typescript', 'vim', 'vimdoc', 'yaml', 'zig',
      })

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  }
}
