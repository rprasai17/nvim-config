return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = { 'ellisonleao/gruvbox.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }

    -- Set gruvbox-light compatible colors
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#cc241d' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#d79921' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#458588' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#d65d0e' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#98971a' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#b16286' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#689d6a' })
      end,
    })
  end,
}
