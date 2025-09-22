return {
  'andymass/vim-matchup',
  dependencies = { 'catppuccin' },
  init = function()
    -- show popup when match is off-screen
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    vim.g.matchup_motion_enabled = 0
    vim.g.matchup_text_obj = 0
  end,
  config = function()
    -- Use UIEnter which runs after VimEnter and should be after colorscheme setup
    vim.api.nvim_create_autocmd('UIEnter', {
      callback = function()
        vim.api.nvim_set_hl(0, 'MatchParen', {
          fg = '#ff0099',
          bg = 'NONE',
          sp = '#cc0000',
          underdouble = true,
          bold = true,
          italic = true,
          nocombine = true,
        })
        vim.api.nvim_set_hl(0, 'MatchWord', { fg = '#ffffff', bg = '#50a14f', underline = true, bold = true })
      end,
    })
    -- Set highlights after colorscheme loads
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'MatchParen', {
          fg = '#ff0099',
          bg = 'NONE',
          sp = '#cc0000',
          bold = true,
          underdouble = true,
          italic = true,
          nocombine = true,
        })
        vim.api.nvim_set_hl(0, 'MatchWord', {
          fg = '#ffffff',
          bg = '#50a14f',
          underline = true,
          bold = true,
        })
      end,
    })
  end,
}
