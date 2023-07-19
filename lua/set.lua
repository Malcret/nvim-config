vim.opt.updatetime = 300

vim.opt.nu = true
vim.opt.relativenumber = false

-- Tab size
vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:| "

vim.opt.smartindent = true

vim.opt.wrap = false

-- Backup
if vim.loop.os_uname().sysname ~= "Windows_NT" then
	vim.opt.swapfile = false
	vim.opt.backup = false
	vim.opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
	vim.opt.undofile = true
end

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "125"