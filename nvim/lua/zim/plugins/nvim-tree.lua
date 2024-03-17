return {
    "nvim-tree/nvim-tree.lua",
    

    config = function()
        

        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 35,
                relativenumber = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
                    default = "",
                    folder = {
                        arrow_closed = "+", -- arrow when folder is closed
                        arrow_open = "-", -- arrow when folder is open
                        default = "/",
                    },
                },
            },
        },
        -- window splits
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
    })
        local keymap = vim.keymap -- for conciseness

   end,
}
