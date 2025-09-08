return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
      char = '',
    },
    whitespace = {
      highlight = { 'CursorColumn', 'Whitespace' },
      remove_blankline_trail = true,
    },
    scope = { enabled = true },
  },
  config = function(_, opts)
    local hooks = require 'ibl.hooks'

    local colors = {
      RainbowRed = '#E06C75',
      RainbowYellow = '#E5C07B',
      RainbowBlue = '#61AFEF',
      RainbowOrange = '#D19A66',
      RainbowGreen = '#98C379',
      RainbowViolet = '#C678DD',
      RainbowCyan = '#56B6C2',
    }

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      for group, fg in pairs(colors) do
        vim.api.nvim_set_hl(0, group, { fg = fg })
      end
    end)

    require('ibl').setup(opts)
  end,
}
