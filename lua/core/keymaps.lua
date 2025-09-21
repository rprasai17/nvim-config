-- Keymaps

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Helper: skip neo-tree when moving around windows
local function smart_nav(dir)
  vim.cmd('wincmd ' .. dir)

  if vim.bo.filetype == 'neo-tree' then
    -- Always move right if we hit neo-tree
    smart_nav 'l'
  end
end

-- Remap window movement keys
vim.keymap.set({ 'n', 't' }, '<C-h>', function()
  smart_nav 'h'
end, { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-j>', function()
  smart_nav 'j'
end, { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-k>', function()
  smart_nav 'k'
end, { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-l>', function()
  smart_nav 'l'
end, { silent = true })

-- Append to end of the line while in insert mode
vim.keymap.set({ 'n', 'i' }, '<C-e>', '<Esc>A', { noremap = true, silent = true, desc = 'Go to end of line and insert' })
