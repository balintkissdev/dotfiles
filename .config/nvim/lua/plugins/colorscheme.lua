return {
  { -- Theme
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        terminal_colors = true,
        filter = "ristretto",
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}

