-- Initial version of settings inspired from
-- https://github.com/arnvald/viml-to-lua/blob/main/lua/settings.lua

HOME = os.getenv("HOME")

vim.g.mapleader = ','

-- basic settings
vim.o.encoding = "utf-8"

-- Display
vim.o.showmatch  = true -- show matching brackets
vim.o.scrolloff = 3 -- always show 3 rows from edge of the screen
-- vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
-- vim.o.laststatus = 2 -- always show status line

vim.o.list = false -- do not display white characters
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.wrap = true --do not wrap lines even if very long
vim.o.eol = false -- show if there's no eol char
vim.o.showbreak= '↪' -- character to show when line is broken


-- Sidebar
vim.o.number = true -- line number on the left
vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
vim.o.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar


-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search

vim.o.matchtime = 2 -- delay before showing matching paren
vim.o.mps = vim.o.mps .. ",<:>"



-- White characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4 -- 1 tab = 4 spaces
vim.o.shiftwidth = 4 -- indentation rule
-- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.formatoptions = 'qnj1'
vim.o.expandtab = true -- expand tab to spaces

