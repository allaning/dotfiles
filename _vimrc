set nocompatible

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
"set number  " show line numbers
set relativenumber  " show relative line numbers
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

" Automatically change the current directory
set autochdir

set nobackup
set nowritebackup

" Set swap/temp directory
set backupdir=C:\temp,C:\RTN,.
set directory=C:\temp,C:\RTN,.

" Set grep program
set grepprg=C:\cygwin64\bin\grep.exe\ -nH

" Use tags in parent directory
set tags+=tags;/

" See vimfiles/plugins/cscope_maps.vim
if has('cscope')
  set csprg=C:\cygwin64\bin\cscope.exe
endif


" Syntax
au BufEnter,BufRead,BufNewFile,FileReadPost *.txt     setfiletype text


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert

set background=dark
hi Normal guifg=grey90 guibg=grey20
hi LineNr guifg=#306888 guibg=grey15
hi NonText guifg=grey30 guibg=grey20
hi SpecialKey guifg=grey30 guibg=grey20
hi CursorLine guibg=grey25
hi Search guibg=#5080c0

" Vimdiff
"hi DiffAdd      gui=none    guifg=NONE          guibg=#406080
"hi DiffDelete   gui=none    guifg=#a01010       guibg=#801010
"hi DiffChange   gui=none    guifg=NONE          guibg=#601010
"hi DiffText     gui=none    guifg=#ff9090       guibg=#b03030
highlight DiffAdd term=bold cterm=bold ctermfg=108 ctermbg=22 gui=bold guifg=#80a8c8 guibg=#28386c
highlight DiffChange term=bold ctermfg=253 ctermbg=52 guibg=#28386c
highlight DiffDelete term=bold ctermfg=59 ctermbg=58 guifg=#6c6661 guibg=#28386c
highlight DiffText term=reverse cterm=bold ctermfg=203 ctermbg=52 gui=bold guifg=#f05060 guibg=#4a343a

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

" Easier escape
inoremap jk <esc>

" Open vimrc
nnoremap <leader>v :e ~\_vimrc<cr>
" Source vimrc
nnoremap <leader>s :source ~\_vimrc<cr>

" Back up vim files to shared drive
nnoremap <leader>bu :!cp -R "C:/Users/1021887/_vimrc" "S:/Team Members/IngAllan/vim"<cr>:!cp -R "C:/Users/1021887/vimfiles" "S:/Team Members/IngAllan/vim"<cr>

" Maximize window
nnoremap <leader>x :simalt ~x<cr>

" Change to location of current file and show pwd after
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Write
nnoremap <leader>w :w<cr>

" Always show choices for multiple definitions
nnoremap <c-]> g<c-]>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Keep selection after (un)indenting
vnoremap > >gv
vnoremap < <gv

" Navigate buffers
nnoremap <c-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>

" Navigate clist
nnoremap <a-right> :cn<cr>
nnoremap <a-left> :cp<cr>


" Select all
nnoremap <leader>a ggVG

" Yank selected text to Windows clipboard
vnoremap <leader>y "+y
" Yank inside word to Windows clipboard
nnoremap <leader>yw "+yiw
" Yank inside Word to Windows clipboard
nnoremap <leader>yW "+yiW

" Draw a line divider
nnoremap <leader>l O--------------------------------------------------------------------------------<cr><esc>

" Insert date as MM/DD/YY
nnoremap <F2> ^"=strftime("%m/%d/%y")<CR>Pa <ESC>
inoremap <F2> <C-R>=strftime("%m/%d/%y")<CR> 

