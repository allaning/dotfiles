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

let g:tagbar_ctags_bin = 'C:\cygwin64\bin\ctags.exe'

" Use tags in parent directory
set tags+=tags;/
" Use OS tags created from include directories via steps:
" 1. In cygwin, cd to include directory, e.g. D:\rtn\windriver\3.9\vxworks-6.9\target\h
" 2. Enter command: ctags --recurse --c++-kinds=+p+l
"    where "--c++-kinds=+p+l" tells ctags to include extern functions like logMsg
set tags+=D:\rtn\windriver\3.9\vxworks-6.9\target\h\tags
" TODO Add C:\WindRiver65\vxworks-6.5\target\h ?

" See vimfiles/plugin/cscope_maps.vim
if has('cscope')
  set csprg=C:\cygwin64\bin\cscope.exe
endif


" Syntax
au BufEnter,BufRead,BufNewFile,FileReadPost *.txt     setfiletype text
au BufEnter,BufRead,BufNewFile,FileReadPost *.log     setfiletype log


" Plugins

" Installed in ~/vimfiles/autoload/
" Loads plugins unzipped into ~/vimfiles/bundle/ directory
" Run :Helptags to generate documentation for plugins in ~/vimfiles/bundle/
execute pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if 1
  " Use a colorscheme, e.g. from vimfiles/colors
  colorscheme molokai
else
  " Use customized colorscheme
  colorscheme desert

  set background=dark
  hi Normal guifg=grey90 guibg=grey15
  hi LineNr guifg=#306888 guibg=grey10
  hi NonText guifg=grey30 guibg=grey15
  hi SpecialKey guifg=grey30 guibg=grey15
  hi CursorLine guibg=grey20
  hi Search guibg=#5080c0

  " Vimdiff
  highlight DiffAdd term=bold cterm=bold ctermfg=108 ctermbg=22 gui=bold guifg=#80a8c8 guibg=#28386c
  highlight DiffChange term=bold ctermfg=253 ctermbg=52 guibg=#28386c
  highlight DiffDelete term=bold ctermfg=59 ctermbg=58 guifg=#6c6661 guibg=#28386c
  highlight DiffText term=reverse cterm=bold ctermfg=203 ctermbg=52 gui=bold guifg=#f05060 guibg=#4a343a
endif

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

" Open current buffer in new tab
nnoremap <leader>t :tab split<cr>

" Keep selection after (un)indenting
vnoremap > >gv
vnoremap < <gv

" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings: >
" See :help section
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" Navigate buffers
nnoremap <c-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>

" Navigate clist
nnoremap <a-right> :cn<cr>
nnoremap <a-left> :cp<cr>


" Select all
nnoremap <leader>a ggVG

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


" Draw a line divider
nnoremap <leader>l o--------------------------------------------------------------------------------<cr><esc>

" Insert date as MM/DD/YY
nnoremap <F2> ^"=strftime("%m/%d/%Y")<CR>Pa <ESC>
inoremap <F2> <C-R>=strftime("%m/%d/%Y")<CR> 


" Plugins

nmap <F8> :TagbarToggle<CR>


" Functions

" Grep recursively in all file types for specified pattern
" Usage:
"   :GR my_search_pattern
function! GR(pattern)
  let cmd = "grep -R ".a:pattern." *"
  exec cmd
endfunction
:command! -nargs=1 GR :call GR(<q-args>)

" Grep recursively and case insensitive in all file types for specified pattern
" Usage:
"   :GRi my_search_pattern
function! GRi(pattern)
  let cmd = "grep -R -i ".a:pattern." *"
  exec cmd
endfunction
:command! -nargs=1 GRi :call GRi(<q-args>)

" Go up num_levels directory levels (only if between 1 and 20, inclusive)
" up to the top level directory.
" Usage:
"   :CdUp 3
function! CdUp(num_levels)
  let idx = a:num_levels
  if idx < 1 || 20 < idx
    " Probably not a valid input
    return 0
  endif
  while idx > 0
    cd ..
    let idx -= 1
  endwhile
  pwd
endfunction
:command! -nargs=1 CdUp :call CdUp(<q-args>)

" Find tags file in current directory or keep looking higher until one is
" found
function! OpenTagsFile()
  let tagsFile = "tags"
  let isFound = 0
  while isFound == 0
    if filereadable(tagsFile)
      execute "edit ".tagsFile
      let isFound = 1
    else
      cd ..
      " Check if we reached the top level directory (just say if cwd is < 4 chars
      let cwd = getcwd()
      if len(cwd) < 4
        break
      endif
    endif
  endwhile
  if isFound == 0
    echo "tags file not found"
  endif
endfunction
:command! -nargs=0 OpenTagsFile :call OpenTagsFile()

