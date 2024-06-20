-- Sync to OS Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>+', '"+', { desc = 'Sync next command to OS clipboard' })

-- Windows
vim.keymap.set('n', '<leader>wn', ':new<CR>', { desc = '[w]indow [n]ew' })
vim.keymap.set('n', '<leader>ws', ':sp<CR>', { desc = '[w]indow [s]plit horizontally' })
vim.keymap.set('n', '<leader>wv', ':vs<CR>', { desc = '[w]indow split [v]ertically' })
vim.keymap.set('n', '<leader>wq', ':q<CR>', { desc = '[w]indow [q]uit' })
vim.keymap.set('n', '<leader>wh', ':wincmd h<CR>', { desc = 'Go to left [w]indow [h]' })
vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>', { desc = 'Go to down [w]indow [j]' })
vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>', { desc = 'Go to up [w]indow [k]' })
vim.keymap.set('n', '<leader>wl', ':wincmd l<CR>', { desc = 'Go to right [w]indow [l]' })
vim.keymap.set('n', '<leader>wH', ':wincmd H<CR>', { desc = 'Move to left [w]indow [H]' })
vim.keymap.set('n', '<leader>wJ', ':wincmd J<CR>', { desc = 'Move to down [w]indow [J]' })
vim.keymap.set('n', '<leader>wK', ':wincmd K<CR>', { desc = 'Move to up [w]indow [K]' })
vim.keymap.set('n', '<leader>wL', ':wincmd L<CR>', { desc = 'Move to right [w]indow [L]' })

-- Buffers
vim.keymap.set('n', '<leader><space>n', ':bn', { desc = '[ ] buffer [n]ext' })
vim.keymap.set('n', '<leader><space>p', ':bp', { desc = '[ ] buffer [p]ext' })
