"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimFiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :VimFilerExplorer<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_enable_clipboard = 0
let g:vimfiler_safe_mode_by_default = 0
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^\.', '^node_modules$', '^bower_components$', '^.wercker$']
