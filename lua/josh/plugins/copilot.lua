return {
  {
    'github/copilot.vim',
    config = function()
      -- vim.g.copilot_no_tab_map = true

      -- vim.keymap.set('i', '<C-J>', 'copilot#Accept("")', { expr = true, silent = true })
      vim.keymap.set('i', '<C-K>', 'copilot#Dismiss()', { expr = true, silent = true })
      -- vim.keymap.set('i', '<C-Space>', 'copilot#GetCompleted()', { expr = true, silent = true })
      -- vim.keymap.set('i', '<C-Tab>', 'copilot#CycleSuggestions()', { expr = true, silent = true })
    end,
  }
}
