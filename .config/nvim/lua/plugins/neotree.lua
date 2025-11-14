-- Neo-tree is a Neovim plugin to browse the file system
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<F2>', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    -- filesystem = {
    --   window = {
    --     mappings = {
    --       ['<F2>'] = 'close_window',
    --     },
    --   },
    -- },
    window = {
      width = 30,
    },
  },
}
