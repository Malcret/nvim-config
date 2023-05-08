vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        mode = "buffers",
        indicator = {
            style = 'underline',
        },
        separator_style = "thin",
        alaways_show_bufferline = true,
        numbers = function(opts)
            return string.format("%s", opts.id)
        end,
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
            {
                filetype = "vista_kind",
                text = "Lsp Tags",
                text_align = "center",
            },
            {
                filetype = "Outline",
                text = " Lsp Tags",
                text_align = "center",
            },
        },
    },
}

vim.keymap.set('n', '<leader>bl', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>bh', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>bql', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bqh', ':BufferLineCloseLeft<CR>')
