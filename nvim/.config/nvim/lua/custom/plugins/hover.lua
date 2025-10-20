return {
  'lewis6991/hover.nvim',
  config = function()
    require('hover').config {
      providers = {
        'hover.providers.diagnostic',
        'hover.providers.lsp',
        'hover.providers.dap',
        'hover.providers.man',
        'hover.providers.dictionary',
        'hover.providers.gh',
        'hover.providers.gh_user',
        'hover.providers.fold_preview',
        'hover.providers.highlight',
      },
      preview_opts = {
        border = 'single',
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        'LSP',
      },
      mouse_delay = 1000,
    }

    -- Setup keymaps
    vim.keymap.set('n', 'K', function()
      require('hover').open()
    end, { desc = 'hover.nvim (open)' })

    vim.keymap.set('n', 'gK', function()
      require('hover').enter()
    end, { desc = 'hover.nvim (enter)' })

    vim.keymap.set('n', '<C-p>', function()
      require('hover').switch 'previous'
    end, { desc = 'hover.nvim (previous source)' })

    vim.keymap.set('n', '<C-n>', function()
      require('hover').switch 'next'
    end, { desc = 'hover.nvim (next source)' })

    -- Mouse support
    -- vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })
    -- vim.o.mousemoveevent = true
  end,
}
