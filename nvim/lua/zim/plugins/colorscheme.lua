return {
    {
        "Mofiqul/vscode.nvim",
        priority = 1000, -- make sure load before all other plugins
        config = function()
            local c = require('vscode.colors').get_colors()
            require('vscode').setup({
                -- Enable transparent background
                transparent = false,
                -- Enable italic comment
                italic_comments = true,
                -- Underline `@markup.link.*` variants
                underline_links = true,
                -- Disable nvim-tree background color
                disable_nvimtree_bg = true,
                -- Override colors (see ./lua/vscode/colors.lua -> on github)
                color_overrides = {
                    vscBack = '#151515',
                    vscCursorDark = '#ff0000',
                },
                -- Override highlight groups (see ./lua/vscode/theme.lua)
                group_overrides = {
                    --    -- this supports the same val table as vim.api.nvim_set_hl
                    --    -- use colors from this colorscheme by requiring vscode.colors!
                    Cursor = { fg = c.vscDarkBlue, bg = c.vscYellow, bold = true },
                }
            })
            --require('vscode').load()

            -- Set cursor color
            --vim.cmd([[colorscheme vscode]])
            --vim.api.nvim_set_hl(0, "Normal", { bg = "#151515" })
            --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#171717" })
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme moonfly]])
            vim.api.nvim_set_hl(0, "Normal", { bg = "#101010" })
        end,
    },
}
