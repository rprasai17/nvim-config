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
      '<leader>m',
      '<cmd>Grapple toggle_tags<cr>',
      desc = 'Toggle Grapple Menu',
      mode = { 'n' },
    },
    -- Add Grapple Tag
    {
      '<leader>a',
      '<cmd>Grapple tag<cr>',
      desc = 'Add Grapple Tag',
      mode = { 'n' },
    },
    -- Remove Grapple Tag
    {
      '<M-d>',
      '<cmd>Grapple untag<cr>',
      desc = 'Remove Grapple Tag',
      mode = { 'n' },
    },
    -- Navigate between Grapple Tags
    {
      '<leader>1',
      '<cmd>Grapple select index=1<cr>',
      desc = 'Select first tag',
      mode = { 'n' },
    },
    {
      '<leader>2',
      '<cmd>Grapple select index=2<cr>',
      desc = 'Select second tag',
      mode = { 'n' },
    },
    {
      '<leader>3',
      '<cmd>Grapple select index=3<cr>',
      desc = 'Select third tag',
      mode = { 'n' },
    },
    {
      '<leader>4',
      '<cmd>Grapple select index=4<cr>',
      desc = 'Select fourth tag',
      mode = { 'n' },
    },
    {
      '<leader>5',
      '<cmd>Grapple select index=5<cr>',
      desc = 'Select fifth tag',
      mode = { 'n' },
    },
    {
      '<leader>6',
      '<cmd>Grapple select index=6<cr>',
      desc = 'Select sixth tag',
      mode = { 'n' },
    },
    {
      '<leader>7',
      '<cmd>Grapple select index=7<cr>',
      desc = 'Select seventh tag',
      mode = { 'n' },
    },
    {
      '<leader>8',
      '<cmd>Grapple select index=8<cr>',
      desc = 'Select eigth tag',
      mode = { 'n' },
    },
    {
      '<leader>9',
      '<cmd>Grapple select index=9<cr>',
      desc = 'Select ninth tag',
      mode = { 'n' },
    },

    {
      '<leader>n',
      '<cmd>Grapple cycle_tags next<cr>',
      desc = 'Go to next tag',
      mode = { 'n' },
    },
    {
      '<leader>p',
      '<cmd>Grapple cycle_tags prev<cr>',
      desc = 'Go to previous tag',
      mode = { 'n' },
    },
  },
}
