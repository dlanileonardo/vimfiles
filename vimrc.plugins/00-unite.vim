"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_force_overwrite_statusline = 0
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_unit = 250
let g:unite_matcher_fuzzy_max_input_length = 40

if executable('ag')
  let g:unite_source_rec_async_command= ['ag', '--follow', '--nocolor', '--nogroup', '--hidden',  '-g', '']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom#profile('default', 'context', {
  \ 'start_insert': 1,
  \ 'wipe': 1,
  \ 'hide-source-names': 1,
  \ 'previewheight': 100,
  \ 'winheight': 15,
  \ 'direction': 'botright',
  \ 'split_rule': 'botright',
  \ 'cursor_line_highlight' : 'CursorLine',
  \ 'ignorecase': 1
\ })
call unite#custom#profile('source/grep', 'context', {
  \ 'no_quit': 1
  \ })
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep,codesearch',
  \ 'ignore_pattern', join(['\.git/', '\.azk', 'tmp/', '\.tmp', '\.mo', '\.jpg', '\.jpeg', '\.png', '.gif', '\.bmp', '\.log', '/log/', '/node_modules', '/bower_components'],
  \ '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite -buffer-name=files -profile-name=default buffer file_rec/async:!<cr>
nnoremap <C-O> :<C-u>Unite -buffer-name=menu -profile-name=default menu<cr>
nnoremap <C-L> :<C-u>Unite -buffer-name=line -profile-name=default -auto-preview line<cr>
nnoremap <C-I> :<C-u>Unite -buffer-name=codesearch -profile-name=default -auto-preview codesearch<cr>
nnoremap <C-k> :<C-u>Unite -buffer-name=tasklist -profile-name=default -auto-preview tasklist<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-a>   <Plug>(unite_move_head)
  imap <buffer> <End>   <Plug>(unite_move_head)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

let g:unite_source_menu_menus = {}
function! SourceMyScripts()
  let file_list = split(globpath("~/.vim/unite-menus", "*"), '\n')
  for file in file_list
    execute( 'source '.file )
  endfor
endfunction
call SourceMyScripts()
