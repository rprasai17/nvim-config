-- Options for init.lua
-- Options need to be imported first into init.lua
--
--
-- <space> is leader key, must be imported before plugins are loaded
-- Otherwise wrong leader key will be used
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enabling Nerd Font for Neovim
vim.g.have_nerd_font = true

--Disable matchparen (performance)
vim.g.loaded_matchparen = 0
vim.o.showmatch = true

vim.o.termguicolors = true

--Line numbers
vim.o.number = true

--Enable mouse mode (useful for resizing splits?)
vim.o.mouse = 'a'

-- Don't display the mode since it's already visible in status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
--   Schedule the setting after `UiEnter` to shorten startup time
--   Remove this option for OS and Neovim clipboard to be separate
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indendation Rules
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Set how Neovim will display certain whitespace characters in the editor
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live while typing
vim.o.inccommand = 'split'

-- Show which line cursor is on
vim.o.cursorline = true

-- Minimal number of screen line to keep above and below the cursor
vim.o.scrolloff = 0

-- Save on quit prompt
vim.o.confirm = true
