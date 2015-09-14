let g:unite_source_menu_menus.rake = {'description' : 'Run common rake tasks for Rails'}
let g:unite_source_menu_menus.rake.command_candidates = []
nnoremap <silent>[menu]r :Unite -silent -start-insert menu:rake<CR>
