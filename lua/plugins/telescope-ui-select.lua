return {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    opts = {
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown()
            },
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("ui-select")
    end,
}
