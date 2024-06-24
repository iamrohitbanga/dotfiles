vim.o.guicursor = ""

-- Set highlight on search
vim.o.hlsearch = true
-- incremental search
vim.o.incsearch = true

-- incremental substitution / live substitution
-- When using ':1,$s/foo/bar', inccommand allows seeing
-- live substitution results. Default value is "nosplit".
-- With "split" we can see the substitution results in a split window.
vim.o.inccommand = "split"

-- Enable mouse mode
-- vim.o.mouse = 'v'
-- Uncomment if you want to enable mouse always
-- vim.o.mouse = 'a'

-- sane splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
-- note smartcase only works if ignorecase is true
vim.o.smartcase = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  https://stackoverflow.com/a/30691754
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Make line numbers default
vim.o.number = true
vim.o.numberwidth = 2

-- Enable break indent
-- Every wrapped line will continue visually indented (same amount of space
-- the beginning of that line), thus preserving horizontal blocks of text.
vim.o.breakindent = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- tabs, spaces
vim.o.tabstop = 4
-- spaces not tabs
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

-- updatetime controls how soon the swap file is written to disk
-- when nothing is typed (default is 4000).
vim.o.updatetime = 250
-- keeping timeoutlen short. Multi-key sequences need to be typed fast for them to take effect
vim.o.timeoutlen = 300
