local opt = vim.opt -- to use vim options

opt.number = true
opt.incsearch = true

-- tab & indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- system clipboard
opt.clipboard:append("unnamedplus")

