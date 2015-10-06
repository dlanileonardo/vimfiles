"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

let g:EasyMotion_smartcase = 1

map <Leader>test :Open(alternate#FindAlternate())<CR>
map <Leader>testV :OpenVertical(alternate#FindAlternate())<CR>