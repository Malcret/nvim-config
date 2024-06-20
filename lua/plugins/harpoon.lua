return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        require('which-key').register({
            ['<leader>h'] = { name = '[h]arpoon', _ = 'which_key_ignore' },
        })

        vim.keymap.set("n", "<leader>th", function() toggle_telescope(harpoon:list()) end,
            { desc = "[t]oggle [h]arpoon" })
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
            { desc = "[h]arpoon [a]dd" })
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
            { desc = "[h]arpoon [p]revious buffer" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
            { desc = "[h]arpoon [n]ext buffer" })
    end
}
