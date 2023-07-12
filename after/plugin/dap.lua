require('mason-nvim-dap').setup {
    ensure_installed = {
        'codelldb',
        'cpptools'
    },
    automatic_installation = true,
}

local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/malcret/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })

local dapcontinue = function()
    if vim.fn.filereadable('.vscode/launch.json') then
        require('dap.ext.vscode').load_launchjs()
    end
    dap.continue()
end

vim.keymap.set('n', '<leader>dc', function() dapcontinue() end)
vim.keymap.set('n', '<leader>dh', function() dap.step_back() end)
vim.keymap.set('n', '<leader>dj', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dk', function() dap.step_out() end)
vim.keymap.set('n', '<leader>dl', function() dap.step_over() end)
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dd', function() dap.disconnect() end)
vim.keymap.set('n', '<leader>dq', function() dap.close() end)
vim.keymap.set('n', '<leader>dx', function() dap.terminate() dap.close() end)
