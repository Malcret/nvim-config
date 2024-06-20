return {
    -- LSP config & plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Usefull status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },

        -- Additional lua config
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
            callback = function(event)
                require('which-key').register({
                    ['<leader>l'] = { name = '[l]sp', _ = 'which_key_ignore' },
                })

                local nmap = function(keys, func, desc)
                   vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
                end

                nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [r]e[n]ame')
                nmap('<leader>la', function()
                    vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
                end, '[l]sp code [a]ction')

                nmap('gd', require('telescope.builtin').lsp_definitions, 'LSP: [g]oto [d]efinition')
                nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [g]oto [r]eferences')
                nmap('gI', require('telescope.builtin').lsp_implementations, 'LSP: [G]oto [I]mplementation')
                nmap('gtd', require('telescope.builtin').lsp_type_definitions, 'LSP: [g]oto [t]ype [d]efinition')
                nmap('gs', require('telescope.builtin').lsp_document_symbols, 'LSP: [g]oto document [s]ymbols')
                nmap('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[l]sp [w]orkspace [s]ymbols')

                -- See `:help K` for why this keymap
                nmap('K', vim.lsp.buf.hover, 'LSP: [K] hover documentation')
                nmap('<C-k>', vim.lsp.buf.signature_help, 'LSP: [C-k] signature documentation')

                -- Lesser used LSP functionality
                nmap('gD', vim.lsp.buf.declaration, 'LSP: [g]oto [D]eclaration')
                nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, '[l]sp [w]orkspace [a]dd folder')
                nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, '[l]sp [w]orkspace [r]emove folder')
                nmap('<leader>lwl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[l]sp [w]orkspace [l]ist folders')

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
                    vim.lsp.buf.format()
                end, { desc = 'Format current buffer with LSP' })

                vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                    vim.lsp.handlers.signature_help, {
                        focus = false,
                        silent = true,
                    }
                )

                vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                    vim.lsp.handlers.hover, {
                        focus = false,
                        silent = true,
                    }
                )

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client then
                    if client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                    if client.server_capabilities.signatureHelpProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHoldI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.signature_help,
                        })
                    elseif client.server_capabilities.hoverProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHoldI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.hover,
                        })
                    end
                end
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            asm_lsp = {},
            bashls = {},
            clangd = {},
            cmake = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = { disable = { 'missing-fields' } },
                },
            },
            rust_analyzer = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
        })
        require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capacilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        })
    end
}
