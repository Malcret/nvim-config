require("nvim-tree").setup {
    open_on_tab = false,
    update_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    filters = {
        custom = {
            '.git',
            '.cache',
        }
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    renderer = {
        highlight_git = true,
        add_trailing = false,
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
        },
    },
    view = {
        width = math.floor(vim.fn.winwidth(0) * 0.125), -- Finding 12.5% of windows width.
        side = "left",
        preserve_window_proportions = false,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
    },
}

vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', {})
