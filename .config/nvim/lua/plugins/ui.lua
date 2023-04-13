return {
  { -- Theme
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        filter = "classic",
      }
      vim.cmd.colorscheme 'monokai-pro'
      vim.cmd.highlight 'ColorColumn guibg=DimGray' -- Enable in tmux
    end,
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'monokai-pro',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Character as colorcolumn
    'xiyaowong/virtcolumn.nvim',
    config = function()
      vim.g.virtcolumn_char = '▏'
    end,
  },
}

