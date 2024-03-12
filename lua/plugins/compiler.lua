return {
    -- 'Zeioth/compiler.nvim',
    -- cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    -- dependencies = {
    --     {
    --         'stevearc/overseer.nvim',
    --         cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    --         opts = {}
    --     },
    -- },
    -- opts = {}
    'stevearc/overseer.nvim',
    dependencies = {
        'mfussenegger/nvim-dap',
    },
    opts = {
        log = {
            {
                type = 'file',
                filename = 'overseer.log',
                level = vim.log.levels.DEBUG,
            },
        },
        dap = true,
    }
}
