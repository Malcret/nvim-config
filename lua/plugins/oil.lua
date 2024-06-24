return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        default_file_explorer = true,
        float = {
            preview_split = 'right',
        },
    },
    config = function(_, opts)
        local oil = require('oil')
        oil.setup(opts)

        local open_with_preview = function()
            oil.open_float(vim.fn.getcwd())
            vim.defer_fn(function()
                oil.open_preview()
            end, 50)
        end

        vim.keymap.set('n', '<leader>.', open_with_preview, { desc = '[.] file manager' })
    end
}
