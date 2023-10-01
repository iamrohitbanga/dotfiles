vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.format_on_save = true

-- Insert new line without entering insert mode: https://vim.fandom.com/wiki/Insert_newline_without_entering_insert_mode
vim.keymap.set('n', '<CR>', 'o<Esc>', { noremap = true, silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remove search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next diagnostic message' })
-- open diagnostic with lsp on "hover"
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'open floating diagnostic message' })
-- open dianostics in a quickfix window
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostics list' })
