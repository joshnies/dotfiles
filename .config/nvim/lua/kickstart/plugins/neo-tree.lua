-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  init = function()
    -- Replace netrw with neo-tree
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      require 'neo-tree'
    end
  end,
  opts = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        visible = true,
        never_show = {
          '.DS_Store',
          '.git',
          'thumbs.db',
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    window = {
      mappings = {
        ['w'] = 'open',
      },
    },
  },
}
