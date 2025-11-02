return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        theme = 'onelight',
        globalstatus = true,
        always_show_tabline = true,
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { require('grapple-line').lualine },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          'mode',
        },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 3 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
