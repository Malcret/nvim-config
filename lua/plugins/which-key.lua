return {
    'folke/which-key.nvim',
    opts = {},
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)

        wk.register({
            ['<leader>'] = { name = '[ ] leader', _ = 'which_key_ignore' },
            ['<leader><space>'] = { name = '[ ] buffer', _ = 'which_key_ignore' },
            ['<leader>b'] = { name = '[b]rowse', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[s]earch', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[r]ename', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[t]oggle', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[w]indow', _ = 'which_key_ignore' },
        })

        wk.register({
            ['<leader>'] = { name = '[ ] leader', _ = 'which_key_ignore' },
        }, { mode = 'v' })
    end
}
