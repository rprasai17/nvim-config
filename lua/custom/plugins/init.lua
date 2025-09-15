-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Requiring keymaps here
require 'custom.keymaps'

vim.opt.termguicolors = true

return {

  require 'custom.plugins.betterterm',
  require 'custom.plugins.lualine',
  require 'custom.plugins.neo-tree',
  require 'custom.plugins.stickybuf',
  require 'custom.plugins.vim-matchup',
  require 'custom.plugins.indent-blankline',
  require 'custom.plugins.autopairs',
  require 'custom.plugins.neoscroll',
  require 'custom.plugins.grapple',
  require 'custom.themes.gruvbox',
}
