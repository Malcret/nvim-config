return {
    'folke/which-key.nvim',
    opts = {},
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)

        wk.add({
            mode = { 'n', 'v' },
            { '<leader>', group = '[ ] leader' },
            { '<leader><space>', group = '[ ] buffer' },
            { '<leader>b', group = '[b]rowse' },
            { '<leader>s', group = '[s]earch' },
            { '<leader>r', group = '[r]ename' },
            { '<leader>t', group = '[t]oggle' },
            { '<leader>w', group = '[w]indow' },
        })
    end
}
