-- Main init.lua file
-- ~/.config/nvim/init.lua
--

-- Core (Must run before plugins)

require 'core.options'
require 'core.keymaps'
require 'core.autocmds'

-- Plugins (Lazy.nvim bootstrap & { import = "plugins" })
require 'setup'
