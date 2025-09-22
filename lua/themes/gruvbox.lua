return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- make sure it loads first
  lazy = false,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = true,
    invert_tabline = true,
    inverse = true,
    contrast = 'hard', -- "hard", "soft", or ""
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  },
  config = function(_, opts)
    require('gruvbox').setup(opts)

    vim.api.nvim_create_autocmd('VimEnter', {
      once = true,
      callback = function()
        vim.o.background = 'light'
        vim.cmd 'colorscheme gruvbox'
      end,
    })
  end,
}
