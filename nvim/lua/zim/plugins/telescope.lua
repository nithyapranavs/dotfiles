return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- makes the sort function work in same way of fzf
    },

    config = function()
        local telescope = require("telescope")
        local actions = require('telescope.actions')
        telescope.setup {
            defaults = {
                initial_mode = 'normal',
                layout_strategy = 'bottom_pane',
                layout_config = {
                    height = 0.4
                },

                mappings = {
                    n = {
                        ['q'] = actions.close,
                        ['<esc>'] = actions.close,
                    }
                },
                --border = false
            },
            pickers = {

            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        }
        telescope.load_extension("fzf");
    end,
}

-- random note
--   :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{}
