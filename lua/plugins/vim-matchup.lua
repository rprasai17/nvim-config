return {
  'andymass/vim-matchup',
  dependencies = { 'ellisonleao/gruvbox.nvim' }, -- Ensure gruvbox loads first
  init = function()
    -- show popup when match is off-screen
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    vim.g.matchup_motion_enabled = 0
    vim.g.matchup_text_obj = 0
    vim.g.matchup_matchparen_hi_surround_always = 1
  end,
  config = function()
    -- Set highlights after colorscheme loads
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'MatchParen', {
          fg = '#ffffff',
          bg = '#ff0000',
          bold = true,
        })
        vim.api.nvim_set_hl(0, 'MatchWord', {
          fg = '#ffffff',
          bg = '#005faf',
          bold = true,
        })
      end,
    })

    -- Also set them immediately in case colorscheme is already loaded
    vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#ffffff', bg = '#ff0000', bold = true })
    vim.api.nvim_set_hl(0, 'MatchWord', { fg = '#ffffff', bg = '#005faf', bold = true })
  end,
}
