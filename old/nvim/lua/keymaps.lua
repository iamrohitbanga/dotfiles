-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }



-- don't use arrow keys
-- map('', '<up>', '<nop>', { noremap = true })
-- map('', '<down>', '<nop>', { noremap = true })
-- map('', '<left>', '<nop>', { noremap = true })
-- map('', '<right>', '<nop>', { noremap = true })
--


-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file
