set nocompatible
set incsearch
set hlsearch
set ignorecase
set hidden
set showmode
set smartcase
set autoindent
set ruler
"set number  " show line numbers
set relativenumber  " show relative line numbers
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list  " show hidden characters
set listchars=tab:>-,trail:-,eol:¬
set guifont=Monospace\ 8
set cmdheight=2

" Automatically change the current directory
set autochdir

set nobackup
set nowritebackup

" Use tags in parent directory
set tags+=tags;/

" keep more context when scrolling off the end of a buffer
set scrolloff=2
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

set t_Co=256
colorscheme molokai
"colorscheme harlequin
"hi LineNr guifg=#306888 guibg=grey15
"hi Search guibg=#5080c0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General format: %-0{minwid}.{maxwid}{item}

" Show the status line
set laststatus=2

"set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=buf=%-4n\0x%-8B%-14(%3l,%02c%03V%)%<%P
set statusline=
set statusline+=%<%f                " file name
set statusline+=\ (%{&ft})          " file type
set statusline+=\ %-4(%m%)          " modified attribute
set statusline+=%r                  " read only attribute
set statusline+=%=                  " right align
set statusline+=buf=%-4n            " buffer number
set statusline+=0x%-4.8B            " hex value
set statusline+=%-14(%3l,%02c%03V%) " row, col
set statusline+=%<%P                " position

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" easier esc
imap jk <esc>

" switch between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" write buffer
nnoremap <leader>w :w<cr>

" Always show choices for multiple definitions
nnoremap <c-]> g<c-]>

" Open current buffer in new tab
nnoremap <leader>t :tab split<cr>

" Keep selection after (un)indenting
vnoremap > >gv
vnoremap < <gv

" Navigate clist
nnoremap <a-right> :cn<cr>
nnoremap <a-left> :cp<cr>


" Select all
nnoremap <leader>a ggVG


" Insert date at front
nnoremap <f2> I<c-r>=strftime("%m/%d/%y")<cr> <esc>
inoremap <f2> <c-r>=strftime("%m/%d/%y")<cr>


