"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimShell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sh :VimShell -buffer-name=Console<CR>

" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "
endif


