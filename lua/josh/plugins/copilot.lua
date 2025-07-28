return {
  {
    'github/copilot.vim',
    config = function()
      -- vim.g.copilot_no_tab_map = true

      vim.keymap.set('i', '<C-K>', 'copilot#Dismiss()', { expr = true, silent = true })

      -- toggle copilot
      local copilot_enabled = true
      function toggle_copilot()
        if copilot_enabled then
          vim.cmd('Copilot disable')
          print("Copilot disabled")
        else
          vim.cmd('Copilot enable')
          print("Copilot enabled")
        end
        copilot_enabled = not copilot_enabled
      end

      vim.keymap.set('n', '<leader>c', toggle_copilot, { desc = "Toggle Copilot", noremap = true, silent = true })
    end,
  }
}
