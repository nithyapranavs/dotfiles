-- set leader k y qr sjace
vim.g.mapleader = " "

local keymap = vim.keymap                                                                                                             -- for conciseness

-- my custom
-- for write and save
keymap.set("n","<F5>", "<cmd>w<CR>", {desc = "writes the file"})
keymap.set("n","<F8>", "<cmd>q<CR>", {desc = "quit the file"})


-- map for nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                         -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })                       -- refresh file explorer

-- map for telescope
-- TODO add tree sitter of telescope

