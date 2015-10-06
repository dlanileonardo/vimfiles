"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bookmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
let g:bookmark_auto_save_file = $HOME.'/.vim/.cache/vim-bookmarks'

nmap <Leader>b <Plug>BookmarkToggle
nmap <Leader>bi <Plug>BookmarkAnnotate
nmap <Leader>ba <Plug>BookmarkShowAll
nmap <Leader>bn <Plug>BookmarkNext
nmap <Leader>bp <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear
nmap <Leader>bx <Plug>BookmarkClearAll