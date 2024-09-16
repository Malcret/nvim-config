return {
    -- DAP config & plugins
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Debugger UI
        {
            'rcarriga/nvim-dap-ui',
            dependencies = {
                'nvim-neotest/nvim-nio',
            },
        },

        -- Automaticly install debug adapters
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Debuggers
    },
    config = function ()
        local dap = require('dap')
        local dapui = require('dapui')

        require('dap.ext.vscode').json_decode = require('overseer.json').decode

        require('mason-nvim-dap').setup({
            automatic_setup = true,
            handlers = {},
            ensure_installed = {
                'codelldb',
            },
        })

        local continue = function()
            if vim.fn.filereadable('.vscode/launch.json') then
                require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' }, lldb = { 'c', 'cpp', 'rs' } })
            end
            dap.continue()
        end

        require('which-key').add({
            { '<leader>d', group = '[d]ap' },
        })

        vim.keymap.set('n', '<leader>dc', continue, { desc = '[d]ebug start/[c]ontinue' })
        vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[d]ebug step [i]nto' })
        vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[d]ebug step [o]ver' })
        vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[d]ebug step [O]ut' })
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[d]ebug toggle [b]reakpoint' })
        vim.keymap.set('n', '<leader>dB', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = '[d]ebug set [B]reakpoint' })

        dapui.setup({
            icons = { expanded = '', collapsed = '', current_frame = '' },
            controls = {
                icons = {
                    pause = '',
                    play = '',
                    step_into = '',
                    step_over = '',
                    step_out = '',
                    step_back = '',
                    run_last = '',
                    terminate = '',
                    disconnect = '',
                },
            },
        })

        vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Debug: See last session result' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        dap.adapters.lldb = {
            type = 'server',
            port = '${port}',
            executable = {
                command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
                args = { '--port', '${port}' },
                detached = false,
            }
        }

        dap.adapters.codelldb = dap.adapters.lldb
    end
}
