vim.g.mapleader = " "

-- Vim explorer
vim.keymap.set("n", "<leader>e", ':NvimTreeFocus<CR>')

-- Insert new line after/before
vim.keymap.set("n", "<CR>", "o<ESC>k")
vim.keymap.set("n", "<C-o>", "O<ESC>j")

-- Move windows
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set('n', '<leader>qq', ':quitall<CR>')
