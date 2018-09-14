" Vim syntax file

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" My Synergy projects
syn match synMyProject /\w\+\~ai\d\+/

" Date in format MM/DD/YY or MM/DD/YYYY
syn match synDate /\d\d\d\d\-\d\d\-\d\d \d\d:\d\d:\d\d /

" Starting update
syn match synStarting /Starting update process.../

" Synergy message log
syn match synWarning /\cWarning[:!] /
syn match synNoBaseline /\d\+ project does not have a baseline project.\|\d\+ projects do not have baseline projects./
syn match synConflict /\t[1-9]\d* Conflict(s) for project \|[1-9]\d* conflicts found\|Unable to update .* due to work area conflicts.\|Work area conflicts were detected./

syn match synTask /Task \d\+: /
syn match synObject /\'\zs\S\{-}\ze\~/  " Non-greedy search for non-white-space between ' and ~
syn match synVersion /\~\zs\S\{-}\ze:/  " Non-greedy search for non-white-space between ~ and :
syn match synReplaces / replaces \|Replacing tasks/
syn match synRemove /Removed the following tasks/
syn match synNewItem / is now bound under /

"hi Normal guifg=grey80
hi def synMyProject guifg=yellow
hi def synDate      guifg=DarkGrey
hi def synStarting  guifg=Green
hi def synWarning   guifg=#ff5555
hi def synNoBaseline guifg=#ff5555
hi def synConflict  guifg=#ff5555
hi def synTask      guifg=#9aabff
hi def synObject    guifg=#99eeee
hi def synVersion   guifg=#338888
hi def synReplaces  guifg=#aaffaa
hi def synRemove    guifg=#ffaaaa
hi def synNewItem   guifg=#ffffaa

let b:current_syntax = "log"

