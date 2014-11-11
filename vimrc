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
set ttyfast " I  got a fast terminal!
set ttimeoutlen=50  " make Esc work faster
set lazyredraw " get faster, redraw only when it's needed
set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
set shiftwidth=2 " auto-indent amount when using >> <<
set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set cursorline " draws a horizontal highlight (or underline, depending on your colorscheme) on the line your cursor is currently on.
set showmatch " when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well. 

let loaded_matchparen=1 " match paranthesis

" GUI-only defaults
if has('gui_running')
  set guifont=Dejavu\ Sans\ Mono\ 9
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=h
  set guioptions-=b
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
set hlsearch   " highlight search matches
set incsearch " search as you type
set gdefault  " global matching is default
set smartcase " use smartcase, when search query starts with Uppercase, turn off case insensitive search

" NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
" let g:nerdtree_tabs_smart_startup_focus=1

" let g:netrw_liststyle=3
" let g:netrw_keepdir=0



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
Plugin 'bling/vim-bufferline'

" color schemes and code highlighting
Plugin 'chriskempson/base16-vim'
Plugin 'vim-ruby/vim-ruby' " Ruby highlighting
Plugin 'jelera/vim-javascript-syntax' " JavaScript highlighting
Plugin 'kchmck/vim-coffee-script' " CoffeeScript highlighting
Plugin 'skammer/vim-css-color' " CSS highlighting
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim' " SCSS highlighting
Plugin 'groenewege/vim-less'
Plugin 'slim-template/vim-slim' " Slim highlighting
Plugin 'tomtom/checksyntax_vim' " Check Syntax of files on Saves

" file navigation/search
Plugin 'https://github.com/kien/ctrlp.vim' " awesome fuzzy finder
Plugin 'jlanzarotta/bufexplorer' " search for files that have been changed
Plugin 'rking/ag.vim' " search for a pattern through the directories (need to install the_silver_searcher)
" Plugin 'scrooloose/nerdtree' " file system tree
Plugin 'majutsushi/tagbar'

" utils
Plugin 'sjl/gundo.vim' " keep tracking of all undos
Plugin 'scrooloose/syntastic' " syntax analyzer
" Plugin 'airblade/vim-gitgutter' " mark lines that have been changed according to Git
Plugin 'tpope/vim-fugitive' " Vim + Git
Plugin 'tpope/vim-surround' " edit what's surrounding a snippet of code
Plugin 'tpope/vim-abolish' " find/replace on steroids
Plugin 'Valloric/YouCompleteMe' " autocomplete (needs to install and configure cmake)
Plugin 'tomtom/tcomment_vim' " comment code
Plugin 'tpope/vim-endwise' " close 'if', 'def' etc
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'vim-scripts/PreserveNoEOL'

" end Vundle
call vundle#end()
filetype plugin indent on

""
" key mapping & stuff
""

" enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" Git gutte" let g:gitgutter_sign_added = '++'
" let g:gitgutter_sign_added = '++'
" let g:gitgutter_sign_removed = '--'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'ww'

" Refresh File
nnoremap <leader>r :e<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" bufexplorer
nnoremap <F6> :BufExplorerHorizontalSplit<CR>

" tComment
map <C-c> :TComment<CR>

" tNumber Line
nnoremap <F4> :set nonumber!<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ignore file (OSX/Linux)
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$'
      \ }

" Clear Search Highlight
map <F3> :let @/ = ""<CR>

" NERDTree
" map <C-n> :NERDTreeToggle<CR>
" map <F7> :NERDTreeToggle<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

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

" buffer - moving around
map <C-Left> :bprevious<CR>
map <C-Right> :bnext<CR>
map <C-Down> :bdelete!<CR>

" tabs - moving around, (CTRL+t to new tab)
map <C-t> :tabnew<CR>
map <C-M-n> :tabedit %<CR>
map <C-l> :tabnext<CR>

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
highlight CursorLine ctermbg=darkred ctermfg=white gui=bold

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-n> :call ToggleVExplorer()<CR>
map <F7> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_sort_options = 'i'
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" absolute width of netrw window
let g:netrw_winsize = -28

" Change directory to the current buffer when opening files.
" set autochdir
"


