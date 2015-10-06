""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors Customize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Transparent Background
hi Normal ctermbg=none

" Syntastic
hi SpellBad ctermfg=000 ctermbg=001 guifg=#990000 guibg=#990000
hi SpellCap ctermfg=000 ctermbg=003 guifg=#990000 guibg=#990000
hi SyntasticError ctermfg=000 ctermbg=001 guifg=#990000 guibg=#990000
hi SyntasticWarning ctermfg=000 ctermbg=003 guifg=#990000 guibg=#990000

" Vim Airline
highlight DiffAdd    cterm=bold ctermfg=black ctermbg=blue gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=black ctermbg=red gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=black ctermbg=yellow gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=black ctermbg=white gui=none guifg=bg guibg=Red

" YouCompleteMe
highlight Pmenu ctermfg=black ctermbg=grey gui=bold
highlight PmenuSel ctermfg=yellow ctermbg=darkgrey gui=bold

" Cursor Line
highlight CursorLine ctermbg=green ctermfg=black
au InsertLeave * hi CursorLine ctermbg=green ctermfg=black
au InsertEnter * hi CursorLine ctermbg=red ctermfg=black

" Number Column
highlight LineNr ctermfg=green ctermbg=black gui=bold
highlight CursorLineNr ctermfg=black ctermbg=green gui=bold

" Gutter / Signs
highlight SignColumn ctermbg=black guibg=black

" Bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=1
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=2

highlight BookmarkLine ctermbg=1 ctermfg=NONE
highlight BookmarkAnnotationLine ctermbg=2 ctermfg=NONE

" Flog
:let g:flog_low_color_hl = "term=standout ctermfg=green ctermbg=black guifg=green guibg=black"
:let g:flog_medium_color_hl = "term=standout ctermfg=yellow ctermbg=black guifg=yellow guibg=black"
:let g:flog_high_color_hl = "term=standout cterm=bold ctermfg=red ctermbg=black gui=bold guifg=red guibg=black"
:let s:background_hl = "guifg=white guibg=black gui=NONE"