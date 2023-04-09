return {
  { -- Theme
    'sickill/vim-monokai',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'monokai'
    end,
  },
}

