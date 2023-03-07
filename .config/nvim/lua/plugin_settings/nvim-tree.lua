-- nvim-tree config

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeFocus<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<F4>', ':NvimTreeFindFile<CR>', {noremap = true})

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "h", action = "toggle_help" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
})
