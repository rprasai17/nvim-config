return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'global',
    icons = 'true',
    style = 'relative',
    tag_title = function(_)
      return ' 󰛢 Grapple '
    end,
    win_opts = {
      width = 80,
      height = 15,
      row = 0.5,
      col = 0.5,

      relative = 'editor',
      border = 'rounded',
      focusable = false,
      style = 'minimal',

      title = ' Grapple ',
      title_pos = 'center',
      title_padding = '  ',
      footer = '',
      footer_pos = 'center',
    },
  },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = false },
  },
  cmd = 'Grapple',
  keys = {
    -- Toggle Grapple Menu
    {
      '<M-m>',
      '<cmd>Grapple toggle_tags<cr>',
      desc = 'Toggle Grapple Menu',
      mode = { 'n', 't' },
    },
    -- Add Grapple Tag
    {
      '<M-a>',
      '<cmd>Grapple tag<cr>',
      desc = 'Add Grapple Tag',
      mode = { 'n', 't' },
    },
    -- Remove Grapple Tag
    {
      '<M-d>',
      '<cmd>Grapple untag<cr>',
      desc = 'Remove Grapple Tag',
      mode = { 'n', 't' },
    },
    -- Navigate between Grapple Tags
    {
      '<M-q>',
      '<cmd>Grapple select index=1<cr>',
      desc = 'Select first tag',
      mode = { 'n', 't' },
    },
    {
      '<M-w>',
      '<cmd>Grapple select index=2<cr>',
      desc = 'Select second tag',
      mode = { 'n', 't' },
    },
    {
      '<M-e>',
      '<cmd>Grapple select index=3<cr>',
      desc = 'Select third tag',
      mode = { 'n', 't' },
    },
    {
      '<M-r>',
      '<cmd>Grapple select index=4<cr>',
      desc = 'Select fourth tag',
      mode = { 'n', 't' },
    },
    {
      '<M-n>',
      '<cmd>Grapple cycle_tags next<cr>',
      desc = 'Go to next tag',
      mode = { 'n', 't' },
    },
    {
      '<M-p>',
      '<cmd>Grapple cycle_tags prev<cr>',
      desc = 'Go to previous tag',
      mode = { 'n', 't' },
    },
  },
}
