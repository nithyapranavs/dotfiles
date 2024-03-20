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
        local builtin = require("telescope.builtin")
        telescope.setup {
            defaults = {
                initial_mode = 'normal',
                layout_strategy = 'bottom_pane',
                layout_config = {
                    height = 0.5
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

        -- keymaps

        -- TODO add tree sitter of telescope
        vim.keymap.set("n", "<C-F>", builtin.current_buffer_fuzzy_find, { desc = "Find string in currrent file" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    end,
}

-- random note
--   :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{}
