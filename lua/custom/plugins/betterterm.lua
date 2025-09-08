return {
  'CRAG666/betterTerm.nvim',

  keys = {

    {
      mode = { 'n', 't' },
      '<C-\\>',
      function()
        require('betterTerm').open()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd 'wincmd l'
        end
      end,
      desc = 'Open BetterTerm 1',
    },

    {
      mode = { 'n', 't' },
      '<M-s>',
      function()
        local current_buf = vim.fn.bufname '%'

        -- Set flag that select is being called while Terminal 1
        -- is focused
        vim.g.select_from_terminal_1 = (current_buf == 'TERMINAL (1)')

        require('betterTerm').select()
      end,
      desc = 'Select Terminal',
    },
  },
  opts = {
    prefix = 'TERMINAL',
    startInserted = true,
    show_tabs = true,
    new_tab_mapping = '<M-t>',
    position = 'bot',
    size = 12,
    index_base = 1,
  },

  config = function(_, opts)
    require('betterTerm').setup(opts)

    -- Autocmd to check if already in TERMINAL (1)

    -- 1) Mark calls that originate from the select() UI
    -- AFTER betterTerm.setup()
    do
      local orig_select = vim.ui.select
      vim.ui.select = function(items, opts, on_choice, ...)
        local from_bt = opts and type(opts.prompt) == 'string' and opts.prompt:lower():find('select a term', 1, true)
        if from_bt then
          local wrapped = function(choice, idx)
            vim.g.__bt_from_betterterm_select = true
            local ok, err = pcall(on_choice or function() end, choice, idx)
            vim.g.__bt_from_betterterm_select = false
            if not ok then
              error(err)
            end
          end
          return orig_select(items, opts, wrapped, ...)
        end
        return orig_select(items, opts, on_choice, ...)
      end
    end

    do
      local ok, bt = pcall(require, 'betterTerm')
      if ok and bt and type(bt.open) == 'function' then
        local orig_open = bt.open
        bt.open = function(id, opts)
          if vim.g.__bt_from_betterterm_select then
            if vim.bo.filetype == 'better_term' then
              local cur = vim.fn.bufname '%' -- e.g. "Term (0)"
              local cur_idx = tonumber((cur:match '%((%d+)%)' or ''))
              local same = (type(id) == 'string' and id == cur)
                or (type(id) == 'number' and cur_idx and id == cur_idx)
                or (id == nil and cur ~= '' and cur_idx ~= nil) -- treat nil as "current" while in a term
              if same then
                return
              end
            end
          end
          return orig_open(id, opts)
        end
      end
    end

    --
  end,
}
