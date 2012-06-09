set nocompatible

nmap <Leader>v :e ~/.vimrc<CR>
nmap <Leader>s :source ~/.vimrc<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set hidden
set showmode
set smartcase
set autoindent
set incsearch
set hlsearch
set ruler
set number  " show line numbers
set smartindent
set ts=4 sts=4 sw=4 expandtab
set list  " show hidden characters
set listchars=tab:>-,trail:-,eol:¬
"set lines=60 columns=120
"set guifont=courier_new:h9

set cmdheight=2
set guioptions-=T  " hide toolbar buttons

"colorscheme xoria256  " http://www.vim.org/scripts/script.php?script_id=625
colorscheme molokai

"hi LineNr guifg=black guibg=grey35
hi NonText guifg=grey30
hi SpecialKey guifg=grey20
