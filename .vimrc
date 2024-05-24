"       _                    
"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"  \_/ |_|_| |_| |_|_|  \___|
"                                           
set number
set relativenumber
set sw=4
set sts=4
set belloff=all
set incsearch
"set colorcolumn=76
highlight colorcolumn ctermbg=8 guibg=lightgrey
call plug#begin()
    Plug 'tpope/vim-surround'
    "themes
    Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
    "space
    Plug 'vim-airline/vim-airline'
    Plug 'christoomey/vim-tmux-navigator'

    "fzf in vi
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme moonfly

"key maps
    nmap        <F3>                    :q<CR>
    nmap        <F7>                    :update<CR>
    imap        jk                      <esc>

