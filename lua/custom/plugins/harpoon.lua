return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  depedencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      default = {
        display = function(list_item)
          local list = harpoon:list()
          local index = nil
          for i, item in ipairs(list.items) do
            if item.value == list_item.value then
              index = i
              break
            end
          end

          -- Map index to your keymaps
          local keymaps = { 'Alt-q', 'Alt-w', 'Alt-e', 'Alt-r' }
          local keymap = keymaps[index] or tostring(index)

          local absolute_path = vim.fn.fnamemodify(list_item.value, ':p')

          return string.format('%s  --  %s', keymap, absolute_path)
        end,
      },
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    }

    -- Keymaps

    -- Add Harpoon Mark
    vim.keymap.set('n', '<M-a>', function()
      -- Don't add terminal buffer to Mark
      if vim.bo.buftype == 'terminal' then
        return
      end
      -- Don't add Neo-tree buffer to Mark
      if vim.bo.filetype == 'neo-tree' then
        return
      end

      harpoon:list():add()
    end)

    --Delete a Harpoon Mark
    vim.keymap.set('n', '<M-d>', function()
      harpoon:list():remove()
    end)

    -- Toggle Harpoon Menu
    vim.keymap.set({ 'n', 't' }, '<M-m>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Navigate between Harpoon Marks
    vim.keymap.set({ 'n', 't' }, '<M-q>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-w>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-e>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-r>', function()
      harpoon:list():select(4)
    end)

    --Navigate between previous and next buffers
    vim.keymap.set({ 'n', 't' }, '<M-n>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set({ 'n', 't' }, '<M-p>', function()
      harpoon:list():next()
    end)
  end,
}
