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
    -- options go here
    enable_git_status = true,
    open_files_using_relative_paths = false,
    default_component_configs = {
      name = {
        trailing_slash = true,
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
    --
    --
    --
  },

  -- Autostart Neotree on Nvim Boot
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.cmd 'Neotree'
        vim.cmd 'wincmd l'
      end,
    })
  end,
}
