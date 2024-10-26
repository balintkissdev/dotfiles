return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  --  These plugins are disabled when used with Visual Studio Code with the
  --  VSCode Neovim extension.

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    enabled = vim.g.vscode == nil,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {},
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    enabled = vim.g.vscode == nil,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',

      {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
      },

      'saadparwaiz1/cmp_luasnip'
    },
  },
}
