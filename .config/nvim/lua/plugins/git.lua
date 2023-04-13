-- Git related plugins
return {
  'tpope/vim-fugitive',

  { -- Display git blame on current line
    'APZelos/blamer.nvim',
    config = function()
      vim.g.blamer_enabled = 1
    end,
  }
}

