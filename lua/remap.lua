vim.g.mapleader = " "

-- Vim explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Insert new line after/before
vim.keymap.set("n", "<CR>", "o<ESC>k")
vim.keymap.set("n", "<C-o>", "O<ESC>j")
