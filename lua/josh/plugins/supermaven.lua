return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
      vim.keymap.set('n', '<leader>c', function()
        vim.cmd('SupermavenToggle')
        print('Supermaven toggled')
      end, { noremap = true, silent = true })
    end,
  }
}
