return {
    'ahmedkhalf/project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    opts = {},
    event = 'VeryLazy',
    config = function(_, opts)
        require('project_nvim').setup(opts)
        require('telescope').load_extension('projects')
    end,
    keys = {
        { '<leader>fp', '<Cmd>Telescope projects<CR>', desc = '[F]ind [P]rojects' }
    }
}
