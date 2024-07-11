-- Colors
vim.o.termguicolors = true

-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Tab behavior
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Indentation behavior
vim.o.autoindent = true
-- vim.o.smartindent = true --deprecated ?

-- Wrap words
vim.o.wrap = true
vim.o.breakindent = true
vim.g.man_hardwrap = 0

-- Highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard with OS
-- vim.o.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
