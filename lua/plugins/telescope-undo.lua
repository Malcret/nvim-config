return {
    "debugloop/telescope-undo.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    opts = {
        extensions = {
            undo = {},
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")

        vim.keymap.set('n', '<leader>su', ':Telescope undo<CR>', { desc = "[s]earch [u]ndo history" })
    end,
}
