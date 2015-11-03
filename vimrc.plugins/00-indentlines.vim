"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '→'
let g:indentLine_color_term = 16
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_enabled = 1
let g:indentLine_noConcealCursor = 1
let g:indentLine_concealcursor = 1
map <leader>u :IndentLinesToggle<CR>
