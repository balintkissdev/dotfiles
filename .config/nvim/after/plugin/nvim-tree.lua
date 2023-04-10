-- Open tree on startup
local function open_nvim_tree(data)
  -- Only switch if it's a directory
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end

  -- Switch to opened directory
  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.toggle({
    focus = false,
  })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Keymaps
vim.keymap.set("", "<F2>", ":NvimTreeToggle<CR>")
