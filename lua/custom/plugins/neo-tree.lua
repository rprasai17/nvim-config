return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    enable_git_status = true,
    open_files_using_relative_paths = false,
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        highlight = 'NeoTreeIndentMarker',
        -- expander config, needed for nesting files
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '󰜌',
        provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
          if node.type == 'file' or node.type == 'terminal' then
            local success, web_devicons = pcall(require, 'nvim-web-devicons')
            local name = node.type == 'terminal' and 'terminal' or node.name
            if success then
              local devicon, hl = web_devicons.get_icon(name)
              icon.text = devicon or icon.text
              icon.highlight = hl or icon.highlight
            end
          end
        end,
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = '*',
        highlight = 'NeoTreeFileIcon',
      },
      name = {
        trailing_slash = true,
        highlight = 'NeoTreeFileName',
      },
    },
    window = {
      position = 'left',
      width = 20,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_hidden = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      group_empty_dirs = false,
      use_libuv_file_watcher = true,
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      group_empty_dirs = true,
    },

    --
    --
    --
  },

  -- Autostart Neotree on Nvim Boot
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        -- defer to ensure neo-tree is loaded
        vim.schedule(function()
          require('neo-tree.command').execute {
            action = 'show', -- or "show"
            reveal_force_cwd = true,
          }
          -- optional: move focus back to the right-hand window
          vim.cmd 'wincmd l'
        end)
      end,
    })
  end,
}
