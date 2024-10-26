-- Git related plugins
return {
  'tpope/vim-fugitive',

  { -- Display git blame on current line
    'TimothyGCY/blamer.nvim',
     -- Contains PowerShell fix, https://github.com/APZelos/blamer.nvim/pull/65
    config = function()
      vim.g.blamer_enabled = 1
    end,
  }
}

