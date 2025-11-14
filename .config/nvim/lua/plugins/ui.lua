return {
  { -- Colorscheme
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('monokai-pro').setup {
        filter = 'classic',
      }
      vim.cmd.colorscheme 'monokai-pro'
      vim.cmd.highlight 'ColorColumn guibg=DimGray' -- Enable in tmux
    end,
  },

  -- Highlight TODO, NOTE, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  { -- Character as colorcolumn
    'xiyaowong/virtcolumn.nvim',
    enabled = vim.g.vscode == nil,
    config = function()
      vim.g.virtcolumn_char = '▏'
    end,
  },
}
