return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out

    config = function()
        local todoComment = require("todo-comments")
        todoComment.setup()

        -- keymaps
        vim.keymap.set("n", "<leader>tf", "<cmd>TodoTelescope<CR>", { desc = "List in telescope" })
    end,
}
