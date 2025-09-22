return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  dependencies = { 'catppuccin' },
  opts = {
    indent = {
      char = '│',
      tab_char = '»',
      smart_indent_cap = true,
    },
    whitespace = {
      remove_blankline_trail = true,
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
    },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  },
  config = function(_, opts)
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local colors = {
        red = '#cc241d',
        orange = '#d65d0e',
        yellow = '#d79921',
        green = '#98971a',
        aqua = '#689d6a',
        blue = '#458588',
        purple = '#b16286',
        gray = '#928374',
      }

      -- Set rainbow colors with appropriate opacity for light theme
      vim.api.nvim_set_hl(0, 'IblRed', { fg = colors.red })
      vim.api.nvim_set_hl(0, 'IblOrange', { fg = colors.orange })
      vim.api.nvim_set_hl(0, 'IblYellow', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, 'IblGreen', { fg = colors.green })
      vim.api.nvim_set_hl(0, 'IblAqua', { fg = colors.aqua })
      vim.api.nvim_set_hl(0, 'IblBlue', { fg = colors.blue })
      vim.api.nvim_set_hl(0, 'IblPurple', { fg = colors.purple })

      vim.api.nvim_set_hl(0, 'IblScope', { fg = colors.blue, bold = true })
    end)

    -- Enable rainbow colors
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- Update indent highlight to use our rainbow colors
    opts.indent.highlight = {
      'IblRed',
      'IblBlue',
      'IblYellow',
      'IblPurple',
      'IblGreen',
      'IblOrange',
      'IblAqua',
    }

    require('ibl').setup(opts)
  end,
}
