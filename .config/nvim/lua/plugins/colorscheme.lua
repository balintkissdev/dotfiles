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
}

