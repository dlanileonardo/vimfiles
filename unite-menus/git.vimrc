let g:unite_source_menu_menus.git = {'description' : 'Manager Git Repositories' }
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ git                                                        ⌘ ,gt', 'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs', 'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd', 'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc', 'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl', 'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb', 'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw', 'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go', 'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr', 'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm', 'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, saida por buffer)              ⌘ ,gp', 'Git! push'],
    \['▷ git pull         (Fugitive, saida por buffer)              ⌘ ,gP', 'Git! pull'],
    \['▷ git prompt       (Fugitive, saida por buffer)              ⌘ ,gi', 'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)', 'Gcd'],
    \]
" nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
