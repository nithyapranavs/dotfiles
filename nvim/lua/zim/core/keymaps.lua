-- set leader k y qr sjace
vim.g.mapleader = " "

local keymap = vim
    .keymap -- for conciseness

-- my custom
keymap.set("i", "jk", "<Esc>", { desc = "escape" })
-- for write and save
keymap.set("n", "<F7>", "<cmd>update<CR>", { desc = "writes the file" })
keymap.set("n", "<F3>", "<cmd>q<CR>", { desc = "quit the file" })

-- netrw
keymap.set("n", "<leader>ee", "<cmd>Lex<CR>", { desc = "open netrw" })

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv^")
keymap.set("v", ">", ">gv^")

-- Move text up and down
keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- buffer switch
keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")
-- random

