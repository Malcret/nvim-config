return {
    'nvimdev/dashboard-nvim',
    dependencies = {
        'ahmedkhalf/project.nvim'
    },
    event = 'VimEnter',
    opts = {
        theme = 'hyper',
        config = {
            header = {
                [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
                [[]],
            },
            shortcut = {
                {
                    icon = ' ',
                    desc = 'Update',
                    action = 'Lazy update | MasonUpdate',
                    key = 'u'
                },
                {
                    icon = ' ',
                    desc = 'Files',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = ' ',
                    desc = 'Projects',
                    action = 'Telescope projects',
                    key = 'p'
                },
                {
                    icon = '󰥨 ',
                    desc = 'Browse',
                    action = 'Telescope file_browser',
                    key = 'b',
                },
                {
                    icon = ' ',
                    desc = 'Config',
                    action = 'lua require(\'telescope.builtin\').find_files({ cwd = vim.fn.stdpath(\'config\') })',
                    key = 'c'
                },
            },
            packages = {
                enable = true
            },
            project = {
                enable = true,
                limit = 4,
            },
            mru = {
                limit = 8,
            },
            -- footer = {}
        },
    },
    config = function(_, opts)
        require('dashboard').setup(opts)

        vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
            pattern = { '*' },
            callback = function()
                local merge_unique = function(t1, t2)
                    local result = {}
                    local seen_values = {}
                    for _, value in ipairs(vim.iter({ t1, t2 }):flatten():totable()) do
                        if not seen_values[value] then
                            seen_values[value] = true
                            table.insert(result, value)
                        end
                    end

                    return result
                end

                -- Fetch project.nvim projects
                local project = require('project_nvim.project')
                local history = require('project_nvim.utils.history')
                local recent = history.recent_projects or {}
                local session = history.session_projects or {}
                local recent_plus_session = merge_unique(recent, session)

                -- Fetch dashboard-nvim projects
                local utils = require('dashboard.utils')
                local path = utils.path_join(vim.fn.stdpath('cache'), 'dashboard/cache')
                local projects = utils.read_project_cache(path) or {}

                -- Add any projects that project.nvim uniquely knows about to dashboard-nvim
                local all_projects = merge_unique(recent_plus_session, projects)
                vim.fn.writefile({ 'return ' .. vim.inspect(all_projects) }, path)

                -- Add any projects that dashboard-nvim uniquely knows about to project.nvim
                local should_save = false
                for _, value in ipairs(projects) do
                    if not vim.tbl_contains(recent_plus_session, value) then
                        pcall(project.set_pwd, value, 'manual') -- skip non-existent directories, dont error
                        should_save = true
                    end
                end
                if should_save then history.write_projects_to_history() end -- < remove this line
            end,
        })
    end
}
