function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi CursorLine ctermbg=yellow ctermfg=black
  elseif a:mode == 'r'
    hi CursorLine ctermbg=red ctermfg=black
  else
    hi CursorLine ctermbg=yellow ctermfg=black
  endif
endfunction

