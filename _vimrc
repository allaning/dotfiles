set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


""""""""""""""""""""" Allan's """"""""""""""""""""""""""

" allow unsaved background buffers and remember marks/undo for them
set hidden

set showmode
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set ruler
set number  " show line numbers
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list  " show hidden characters
set listchars=tab:>-,trail:-,eol:¬
set lines=60 columns=120
set guifont=courier_new:h9
set cmdheight=2
set guioptions-=T  " hide toolbar buttons
set showtabline=2
" keep more context when scrolling off the end of a buffer
set scrolloff=1
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

set nobackup
set nowritebackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme molokai
hi LineNr guifg=#306888 guibg=grey15
hi NonText guifg=grey20
hi SpecialKey guifg=grey20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

imap jk <esc>

nmap <Leader>v :e c:/allan/git/vim/_vimrc<CR>
nmap <Leader>s :source c:/allan/git/vim/_vimrc<CR>
nnoremap <Leader>pwd :cd %:h<CR>
nnoremap <Leader>a gg0vG$
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Move within wrapped lines
nnoremap j gj
nnoremap k gk

