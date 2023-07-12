local db = require("dashboard")

db.setup {
    theme = 'doom',
    config = {
        header = {
            "                                                       ",
            "                                                       ",
            "                                                       ",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "                                                       ",
            "                                                       ",
            "                                                       ",
            "                                                       ",
        },
        center = {
            {
                icon = ' ',
                desc = 'Find Recent File',
                key = 'r',
                keymap = '<leader>fr',
                action = 'Telescope oldfiles',
            },
            {
                icon = ' ',
                desc = 'Find File       ',
                key = 'f',
                keymap = '<leader>ff',
                action = 'Telescope find_files',
            },
            --{
            --    icon = ' ',
            --    desc = 'Find Project    ',
            --    key = 'p',
            --    keymap = '<leader>fp',
            --    action = 'Telescope projects',
            --},
            {
                icon = '󰳝 ',
                desc = 'Quit Nvim       ',
                key = 'q',
                keymap = '<leader>qq',
                action = 'qa'
            },
        },
    }
}
