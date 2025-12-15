return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    adapters = {
      http = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = 'cmd:op read op://Private/anthropic_api_key/password --no-newline',
            },
          })
        end,
      },
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
        model = 'claude-sonnet-4-5',
      },
      inline = {
        adapter = 'copilot',
      },
    },
  },
}
