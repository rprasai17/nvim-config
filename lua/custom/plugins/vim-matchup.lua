return {
  'andymass/vim-matchup',
  init = function()
    -- show popup when match is off-screen
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    vim.g.matchup_motion_enabled = 0
    vim.g.matchup_text_obj = 0
    vim.g.matchup_matchparen_hi_surround_always = 1
  end,
  config = function()
    -- highlight groups for clarity
    vim.cmd [[
      hi MatchParen guifg=#ffffff guibg=#ff0000 gui=bold
      hi MatchWord  guifg=#ffffff guibg=#005faf gui=bold
    ]]
  end,
}
