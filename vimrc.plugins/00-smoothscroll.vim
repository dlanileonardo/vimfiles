""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Smooth Scroll
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8 " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>