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
