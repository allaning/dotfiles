" Vim syntax file

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" My Synergy projects
syn match txtMyProject /\w\+\~ai\d\+/

syn keyword txtTodo TODO

" Underline chars between double underscores
syn match txtWhite /__.*__/

" Date in format MM/DD/YY or MM/DD/YYYY
syn match txtDate /\d\d\/\d\d\/\d\{2,4\}/

hi def txtMyProject ctermfg=yellow guifg=yellow
"hi link txtTodo     Todo
hi def txtTodo      ctermfg=White guifg=White guibg=DarkGrey
hi def txtWhite     ctermfg=White guifg=White gui=underline
hi def txtDate      ctermfg=DarkGrey guifg=DarkGrey

let b:current_syntax = "text"

