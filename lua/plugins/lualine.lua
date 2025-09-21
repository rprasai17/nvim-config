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
        lualine_a = {
          {
            function()
              local grapple = require 'grapple'
              if not grapple.exists() then
                return ''
              end
              local tag = grapple.find()
              if not tag then
                return ''
              end

              local index = grapple.name_or_index()
              local parent_dir = vim.fn.fnamemodify(tag.path, ':h:t')
              local file = vim.fn.fnamemodify(tag.path, ':t')
              return '%#lualine_a_normal#' .. string.format('%s: %s/%s', index, parent_dir, file) .. '%*'
            end,
            cond = function()
              return package.loaded['grapple'] and require('grapple').exists()
            end,
          },
        },
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
