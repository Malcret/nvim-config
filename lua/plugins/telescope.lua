-- Fuzzy Finder (files, lsp, etc)
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder algorithm which requires 'make' on the system
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        'nvim-telescope/telescope-file-browser.nvim'
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
        },
        extensions = {
            file_browser = {
                hijack_netrw = true
            }
        }
    },
    config = function(_, opts)
        require('telescope').setup(opts)

        -- Enable telescope fzf native if installed
        pcall(require('telescope').load_extension, 'fzf')

        -- Function to find the git root directory based on the current buffer's path
        local function find_git_root()
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            if current_file == '' then
                current_dir = cwd
            else
                current_dir = vim.fn.fnamemodify(current_file, ':h')
            end

            local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
            if vim.v.shell_error ~= 0 then
                print('Not a git repository. Searching on current working directory')
                return cwd
            end
            return git_root
        end

        -- Custom live_grep function to search in git root
        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require('telescope.builtin').live_grep({
                    search_dirs = { git_root },
                })
            end
        end

        vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

        local tsbi = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>?', tsbi.oldfiles, { desc = '[?] find recent files' })
        vim.keymap.set('n', '<leader>s<space>', tsbi.buffers, { desc = '[ ] find buffers' })
        vim.keymap.set('n', '<leader>/', function()
            tsbi.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                winbled = 10,
                previewer = false,
            }))
        end, { desc = '[/] fuzzy search in current buffer' })

        local function telescope_live_grep_open_files()
            tsbi.live_grep({
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            })
        end
        vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[s]earch [/] in open files' })
        vim.keymap.set('n', '<leader>ss', tsbi.builtin, { desc = '[s]earch [s]elect telescope' })
        -- vim.keymap.set('n', '<leader>gf', tsbi.git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>sf', tsbi.find_files, { desc = '[s]earch [f]iles' })
        vim.keymap.set('n', '<leader>sh', tsbi.help_tags, { desc = '[s]earch [h]elp' })
        vim.keymap.set('n', '<leader>sw', tsbi.grep_string, { desc = '[s]earch current [w]ord' })
        vim.keymap.set('n', '<leader>sg', tsbi.live_grep, { desc = '[s]earch by [g]rep' })
        -- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
        vim.keymap.set('n', '<leader>sd', tsbi.diagnostics, { desc = '[s]earch [d]iagnostics' })
        vim.keymap.set('n', '<leader>sr', tsbi.resume, { desc = '[s]earch [r]esume' })

        require("telescope").load_extension("file_browser")
        vim.keymap.set('n', '<leader>bf', ':Telescope file_browser<CR>', { desc = '[b]rowse [f]iles' })
        vim.keymap.set('n', '<leader>bF', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[b]rowse [F]iles from current buffer' })
    end
}
