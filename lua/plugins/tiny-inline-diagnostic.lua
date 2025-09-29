return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup {
      preset = 'powerline',
      options = {
        multilines = {
          enabled = true,
        },
        breakline = {
          enabled = true,
        },
      },
    }
    -- Disable Neovim's built-in inline text
    vim.diagnostic.config { virtual_text = false } -- Disable default virtual text
  end,
}
