vim.o.guicursor = ""

-- Set highlight on search
vim.o.hlsearch = true
-- incremental search
vim.o.incsearch = true

-- incremental substitution / live substitution
vim.o.inccommand = "split"

-- Enable mouse mode
vim.o.mouse = 'v'
-- Uncomment if you want to enable mouse always
-- vim.o.mouse = 'a'

-- sane splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Make line numbers default
vim.o.number = true
vim.o.numberwidth = 2

-- Enable break indent
vim.o.breakindent = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- tabs, spaces
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true

-- highlight current line
vim.o.cursorline = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
