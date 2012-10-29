set nocompatible

set incsearch
set hlsearch
set ignorecase
set hidden
set showmode
set smartcase
set autoindent
set ruler
set number  " show line numbers
set smartindent
set ts=3 sts=3 sw=3 expandtab
set list  " show hidden characters
set listchars=tab:>-,trail:-,eol:¬
"set lines=60 columns=120
"set guifont=courier_new:h9
set cmdheight=2

" keep more context when scrolling off the end of a buffer
set scrolloff=3
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

if v:version > 700
    set cursorline
    hi CursorLine guibg=grey15
endif

set backupdir=~\temp,~\tmp,.
set dir=~\temp,~\tmp,.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
hi Normal guifg=grey80 guibg=grey10
hi LineNr guifg=#306888 guibg=grey15
hi NonText guifg=grey20 guibg=grey10
hi SpecialKey guifg=grey20 guibg=grey10
hi Search guibg=#5577ee

nnoremap <f5> :colorscheme oceandeep<cr>
nnoremap <f6> :colorscheme molokai<cr>

set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

nmap <Leader>v :e ~/github/vim/.vimrc<CR>
nmap <Leader>s :source ~/github/vim/.vimrc<CR>

" easier esc
imap jk <esc>

" switch between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Switch between buffers
nnoremap <silent> <leader>6 <c-^>
"nnoremap <silent> <c-tab> :bn<cr>
"nnoremap <silent> <c-s-tab> :bp<cr>

nnoremap <Leader>a gg0vG$

" Move within wrapped lines
nnoremap j gj
nnoremap k gk

" Keep selection after indent
vnoremap < <gv
vnoremap > >gv

" Fold the function by first finding outermost open curly brace, then center around cursor
nnoremap <leader>ff 20[{zf%zz

" Horizontal rule
nnoremap <leader>l o================================================================================<cr><esc>
inoremap <leader>l ================================================================================

" Insert date at front
nnoremap <f2> I<c-r>=strftime("%m/%d/%y")<cr> <esc>
inoremap <f2> <c-r>=strftime("%m/%d/%y")<cr> 

" Insert common buffers
inoremap <c-]> <c-r>"
inoremap <c-\> <c-r>*

" Use normal regex
nnoremap / /\v

" Change to directory of current file
nnoremap <silent> <leader>pwd :cd %:h<cr>:pwd<cr>

