return {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    opts = {
        extensions = {
            file_browser = {
                hijack_netrw = false,
            },
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("file_browser")

        vim.keymap.set('n', '<leader>bf', ':Telescope file_browser<CR>', { desc = '[b]rowse [f]iles' })
        vim.keymap.set('n', '<leader>bF', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[b]rowse [F]iles from current buffer' })
    end,
}
