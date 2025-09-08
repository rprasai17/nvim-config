return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup {}

    local neoscroll = require 'neoscroll'
    local scroll = neoscroll.scroll

    -- Smooth scroll with mouse, cursor fixed
    vim.keymap.set('', '<ScrollWheelDown>', function()
      -- args: distance, move_cursor, time(ms), easing
      scroll(3, false, 5, 'linear')
    end, { silent = true })

    vim.keymap.set('', '<ScrollWheelUp>', function()
      scroll(-3, false, 5, 'linear')
    end, { silent = true })
  end,
}
