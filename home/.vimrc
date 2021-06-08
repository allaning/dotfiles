" Use Pathogen to load bundles
"runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Disable vi compatibility
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
set listchars=tab:▸\ ,trail:-,eol:¬
set cmdheight=2

" Automatically change the current directory
set autochdir

set undolevels=1000
set nobackup
set nowritebackup
set directory=~/.vim/tmp/swap/

source $HOME/.vim/plugin/matchit.vim
source $HOME/.vim/plugin/python_match.vim

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
filetype plugin indent on

" Settings for GVim
if &term == ""
  set lines=50 columns=180
  set guioptions-=T  " hide toolbar buttons
  "set guifont=courier_new:h9
endif

" To view color swatch enter vim command:
" :runtime syntax/colortest.vim
set t_Co=256
colorscheme molokai
"colorscheme harlequin
hi Search ctermfg=white ctermbg=darkblue guifg=white guibg=#3377ff
"hi LineNr guifg=#306888 guibg=grey15
hi CursorLineNr guifg=#a8ffff guibg=grey15
if v:version > 700
    set cursorline
    hi CursorLine guibg=grey5
endif


" Cursor color in xterm
if &term == "screen-256color"
  " insert mode
  let &t_SI = "\<Esc>]12;white\x7"
  " otherwise
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\033]12;white\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif


" Better colors for vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


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

" Always show choices for multiple ctag definitions
nnoremap <c-]> g<c-]>

" Open current buffer in new tab
nnoremap <leader>t :tab split<cr>

" Keep selection after (un)indenting
vnoremap > >gv
vnoremap < <gv

" Navigate buffers
" (This isn't working in RHEL8 xterm)
nnoremap <silent> <c-tab> :bn<cr>
nnoremap <silent> <c-s-tab> :bp<cr>

" Settings for GVim
if &term == ""
  " Yank selected text to OS clipboard
  vnoremap <leader>y "+y
  " Yank inside word to OS clipboard
  nnoremap <leader>yw "+yiw
  " Yank inside Word to OS clipboard
  nnoremap <leader>yW "+yiW

  " Yank path and filename to OS clipboard (will not be on same line in buffer)
  nnoremap <leader>yp :redir @+<cr>:pwd<cr>:redir end<cr>:let @+=@+."\\"<cr>:let @+=@+.@%<cr>
  " Yank filename to OS clipboard
  nnoremap <leader>yf :let @+=@%<cr>
endif

" Navigate clist
" &term defined in .tmux.conf via default-terminal
if &term == "screen-256color"
  " In xterm
  " Use these along with xterm-keys settings in .tmux.conf
  " See http://vim.1045645.n5.nabble.com/Mapping-meta-key-within-tmux-td5716437.html
  nnoremap <esc>[1;3C :cn<cr>
  nnoremap <esc>[1;3D :cp<cr>
else
  nnoremap <a-right> :cn<cr>
  nnoremap <a-left> :cp<cr>
endif

" Select all
nnoremap <leader>a ggVG


" Insert date at front
nnoremap <f2> I<c-r>=strftime("%m/%d/%y")<cr> <esc>
inoremap <f2> <c-r>=strftime("%m/%d/%y")<cr>


