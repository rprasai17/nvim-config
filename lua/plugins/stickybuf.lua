return {
  'stevearc/stickybuf.nvim',
  opts = {},

  config = function()
    local ok, stickybuf = pcall(require, 'stickybuf')
    if not ok then
      return
    end
    stickybuf.setup()

    -- Route foreign buffers out of pinned panes (prefer up, then any unpinned, else new split)
    local function route_foreign_up(bufnr)
      local cur = vim.api.nvim_get_current_win()
      vim.cmd 'wincmd k'
      local up = vim.api.nvim_get_current_win()
      if up ~= cur and not stickybuf.is_pinned(up) then
        vim.api.nvim_win_set_buf(up, bufnr)
        return
      end
      for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if not stickybuf.is_pinned(w) then
          vim.api.nvim_set_current_win(w)
          vim.api.nvim_win_set_buf(w, bufnr)
          return
        end
      end
      vim.api.nvim_set_current_win(cur)
      vim.cmd 'aboveleft split'
      vim.api.nvim_win_set_buf(0, bufnr)
    end

    -- BetterTerm: allow the terminal during creation + better_term thereafter
    local function pin_betterterm(win)
      stickybuf.pin(win, {
        allow = function(bn)
          local b = vim.bo[bn]
          return b.filetype == 'better_term' or b.buftype == 'terminal'
        end,
        handle_foreign_buffer = route_foreign_up,
      })
    end

    -- Neo-tree: simple filetype-based pin
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'neo-tree' },
      callback = function()
        stickybuf.pin(nil, {
          allow_type = 'filetype',
          handle_foreign_buffer = route_foreign_up,
        })
      end,
    })

    -- BetterTerm: pin every window that shows it (handles :sb / reopen)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = function(args)
        if vim.bo[args.buf].filetype == 'better_term' and not stickybuf.is_pinned(args.win) then
          pin_betterterm(args.win)
        end
      end,
    })

    -- Fallback: if timing misses, pin on FileType as well
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'better_term' },
      callback = function()
        local win = vim.api.nvim_get_current_win()
        if not stickybuf.is_pinned(win) then
          pin_betterterm(win)
        end
      end,
    })
  end,
}
