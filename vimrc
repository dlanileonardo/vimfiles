" required
set nocompatible

syntax on

filetype off

colorscheme base16-default " set colorscheme
let base16colorspace=16
set background=dark
set t_Co=16
set t_ut=
set encoding=utf-8 " set charset encoding
" set number "show line numbers
set history=1000 " store lots of :cmdline history
set showcmd " show incomplete cmds down the bottom
set showmode " show current mode down the bottom
set gcr=a:blinkon0 " disable cursor blink
set visualbell " the sound of silence
set autoread " reload files changed outside Vim
set hidden " buffers can exist in the background without being in a window
set list listchars=tab:\ \ ,trail:· " display tabs and trailing spaces visually
set nowrap " don't wrap lines
set linebreak " wrap lines at convenient points
set equalalways " split windows equally
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " there files will be ignored when completing in wild menu
set clipboard+=unnamed,unnamedplus,autoselect " share clipboard
set ttyfast " I  gOt a fast terminal!
set ttimeoutlen=50  " make Esc work faster
set lazyredraw " get faster, redraw only when it's needed
set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
set shiftwidth=2 " auto-indent amount when using >> <<
set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set cursorline " draws a horizontal highlight (or underline, depending on your colorscheme) on the line your cursor is currently on.
set showmatch " when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well.
set novisualbell " Disable visual blink

" Transparent Background
hi Normal ctermbg=none

let loaded_matchparen=1 " match paranthesis

" GUI-only defaults
if has('gui_running')
  set guifont=Dejavu\ Sans\ Mono\ 9
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=h
  set guioptions-=B
  set guioptions-=R
  set guioptions-=L
  set showtabline=2   " show tabs in gvim, not vim
  set guitablabel=%t  " show simple filname as tabname
endif

" main key
let mapleader="\\"

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10

" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level

" search
set hlsearch   " higHlight search matches
set incsearch " search as you type
set gdefault  " global matching is default
set smartcase " use smartcase, when search query starts with Uppercase, turn off case insensitive search

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" scrolling
set scrolloff=8 " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" enable hightlight for markdown
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" tabs
set expandtab " no real tabs!
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" status
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %{fugitive#statusline()}
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ag.vim ignore log and tmp
if !exists("g:agprg")
    let g:agprg="ag --ignore ./log --ignore ./tmp --nogroup --column"
endif

" core plugins
Plugin 'gmarik/Vundle.vim' " Vundle itself
Plugin 'bling/vim-airline' " bottom bar + tabs
Plugin 'edkolev/tmuxline.vim' " I'm still not sure about what it really does
Plugin 'bling/vim-bufferline' " Show buffer in command bar
" Plugin 'fatih/vim-go'

" color schemes and code highlighting
Plugin 'chriskempson/base16-vim' " Vim colors
Plugin 'vim-ruby/vim-ruby' " Ruby highlighting
Plugin 'jelera/vim-javascript-syntax' " JavaScript highlighting
Plugin 'kchmck/vim-coffee-script' " CoffeeScript highlighting
Plugin 'skammer/vim-css-color' " CSS highlighting
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim' " SCSS highlighting
Plugin 'groenewege/vim-less'
Plugin 'slim-template/vim-slim' " Slim highlighting
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/syntastic' " syntax analyzer

" file navigation/search
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'jlanzarotta/bufexplorer' " search for files that have been changed
Plugin 'rking/ag.vim' " search for a pattern through the directories (need to install the_silver_searcher)
Plugin 'majutsushi/tagbar'
Plugin 'skwp/greplace.vim'

" utils
Plugin 'sjl/gundo.vim' " keep tracking of all undos
Plugin 'tpope/vim-fugitive' " Vim + Git
Plugin 'tpope/vim-surround' " edit what's surrounding a snippet of code
Plugin 'tpope/vim-abolish' " find/replace on steroids
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim' " comment code
Plugin 'tpope/vim-endwise' " close 'if', 'def' etc
Plugin 'vasconcelloslf/vim-interestingwords' " Like Sublime Highlight Words
Plugin 'vim-scripts/PreserveNoEOL' " Prevent remove EOL in Final Lines
Plugin 'terryma/vim-multiple-cursors' " Multi Cursors Like Sublime
Plugin 'mattn/emmet-vim' " Emmet =]
Plugin 'sentientmonkey/vim-flog'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Yggdroot/indentLine'
Plugin 'compactcode/open.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'

" Emmet map
let g:user_emmet_leader_key='<C-E>'

" end Vundle
call vundle#end()
filetype plugin indent on

" enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline#themes#base16#constant = 1

" Refresh File
nnoremap <leader>r :e<CR>

" tNumber Line
nnoremap <F4> :set nonumber!<CR>

" Clear Search Highlight
map <F3> :let @/ = ""<CR>

" convenient viewport switching
map <C-h> <C-w>j
map <C-j> <C-w>k
map <C-k> <C-w>i
map <C-l> <C-w>l

" open vertical  split and switch to it
nnoremap <leader>v <C-w>v<C-w>l

" open horizontal  split and switch to it
nnoremap <leader>h :split<CR>

" Save like a pro (CTRL+s)
nnoremap <leader>w :w<CR>

" Quit like a pro
nnoremap <C-M-q> :Kwbd<CR>
nnoremap <leader>q :q<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>wu mQgewvU`Q
nmap <leader>wl mQgewvu`Q

" this key combination gets rid of the search highlights
nmap <leader><space> :noh<cr>

" start ag search
nnoremap <leader>a :Ag

" remove unwanted spaces
nmap <leader>rs :%s/\s\+$//<cr>

" buffer - moving around
map <C-Left> :bprevious<CR>
map <C-Right> :bnext<CR>
map <C-Down> :bdelete!<CR>

" tabs - moving around, (CTRL+t to new tab)
noremap <C-PageUp> :tabprev<CR>
noremap <C-PageDown> :tabnext<CR>
noremap <C-Up> :tabnew<CR>

" noremap <leader>s :w<CR>
" noremap <leader>S :saveas %<CR>
" noremap <C-Home> :tabedit %<CR>

" nmap <c-s> :w<CR>
" vmap <c-s> <Esc><c-s>gv
" imap <c-s> <Esc><c-s>

autocmd BufWritePre * :%s/\s\+$//e
nmap <F10> :update<CR>
vmap <F10> <Esc><F10>gv
imap <F10> <c-o><F10>

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
endif

" YouCompleteMe
highlight Pmenu ctermfg=black ctermbg=grey gui=bold
highlight PmenuSel ctermfg=yellow ctermbg=darkgrey gui=bold

" Cursor Line
highlight CursorLine ctermbg=green ctermfg=black
au InsertLeave * hi CursorLine ctermbg=green ctermfg=black
au InsertEnter * hi CursorLine ctermbg=red ctermfg=black

" Number Column
highlight LineNr ctermfg=green ctermbg=black gui=bold
highlight CursorLineNr ctermfg=black ctermbg=green gui=bold

" Gutter / Signs
highlight SignColumn ctermbg=black guibg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Flog
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let g:flog_low_color_hl = "term=standout ctermfg=green ctermbg=black guifg=green guibg=black"
:let g:flog_medium_color_hl = "term=standout ctermfg=yellow ctermbg=black guifg=yellow guibg=black"
:let g:flog_high_color_hl = "term=standout cterm=bold ctermfg=red ctermbg=black gui=bold guifg=red guibg=black"
:let s:background_hl = "guifg=white guibg=black gui=NONE"
" disable default
:let g:flog_enable=0
nmap <F9> :call ToggleFlog()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BufExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F6> :BufExplorerHorizontalSplit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tComment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :TComment<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimFIler
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_force_overwrite_statusline = 0
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_unit = 250

if executable('ag')
  let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --column --nogroup --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom#profile('default', 'context', {
  \ 'start_insert': 1,
  \ 'winheight': 15,
  \ 'direction': 'botright',
  \ 'split_rule': 'botright',
  \ 'cursor_line_highlight' : 'CursorLine'
\ })
call unite#custom#profile('source/grep', 'context', {
  \ 'no_quit': 1
  \ })
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join(['\.git/', '\.azk', 'tmp/', '\.tmp', '\.mo', '\.jpg', '\.jpeg', '\.png', '.gif', '\.bmp'],
  \ '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite -buffer-name=files -profile-name=default buffer -hide-source-names file_rec/async:!<cr>
nnoremap <space>f :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bookmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight BookmarkSign ctermbg=NONE ctermfg=1
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=2

highlight BookmarkLine ctermbg=1 ctermfg=NONE
highlight BookmarkAnnotationLine ctermbg=2 ctermfg=NONE

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

let g:EasyMotion_smartcase = 1

let g:indentLine_char = '→'
let g:indentLine_color_term = 16
let g:indentLine_enabled = 1
let g:indentLine_noConcealCursor = 1
map <leader>u :IndentLinesToggle<CR>

map <Leader>test :Open(alternate#FindAlternate())<CR>
map <Leader>testV :OpenVertical(alternate#FindAlternate())<CR>

highlight DiffAdd    cterm=bold ctermfg=black ctermbg=blue gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=black ctermbg=red gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=black ctermbg=yellow gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=black ctermbg=white gui=none guifg=bg guibg=Red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dim Active
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:diminactive_use_colorcolumn = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:tmux_navigator_no_mappings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_style_error_symbol = "s✗"
let g:syntastic_style_warning_symbol = "s⚠"

hi SpellBad ctermfg=000 ctermbg=001 guifg=#990000 guibg=#990000
hi SpellCap ctermfg=000 ctermbg=003 guifg=#990000 guibg=#990000
hi SyntasticError ctermfg=000 ctermbg=001 guifg=#990000 guibg=#990000
hi SyntasticWarning ctermfg=000 ctermbg=003 guifg=#990000 guibg=#990000