" required
set nocompatible 

syntax on

filetype on
filetype indent on
filetype plugin on

" defaults
colorscheme hybrid " set colorscheme
set encoding=utf-8 " set charset encoding
set number "show line numbers
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

" main key
let mapleader=","

" search
set hlsearch   " highlight search matches
set incsearch " search as you type
set gdefault  " global matching is default
set smartcase " use smartcase, when search query starts with Uppercase, turn off case insensitive search

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1

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

" core plugins
Plugin 'gmarik/Vundle.vim' " Vundle itself
Plugin 'bling/vim-airline' " bottom bar + tabs
Plugin 'edkolev/tmuxline.vim' " I'm still not sure about what it really does

" color schemes and code highlighting
Plugin 'flazz/vim-colorschemes' " choose the coolest colorscheme
Plugin 'vim-ruby/vim-ruby' " Ruby highlighting
Plugin 'jelera/vim-javascript-syntax' " JavaScript highlighting
Plugin 'kchmck/vim-coffee-script' " CoffeeScript highlighting
Plugin 'skammer/vim-css-color' " CSS highlighting
Plugin 'cakebaker/scss-syntax.vim' " SCSS highlighting
Plugin 'slim-template/vim-slim' " Slim highlighting

" file navigation/search
Plugin 'https://github.com/kien/ctrlp.vim' " awesome fuzzy finder
Plugin 'jlanzarotta/bufexplorer' " search for files that have been changed
Plugin 'rking/ag.vim' " search for a pattern through the directories (need to install the_silver_searcher)
Plugin 'scrooloose/nerdtree' " file system tree

" utils
Plugin 'sjl/gundo.vim' " keep tracking of all undos
Plugin 'scrooloose/syntastic.git' " syntax analyzer
Plugin 'airblade/vim-gitgutter' " mark lines that have been changed according to Git
Plugin 'tpope/vim-fugitive' " Vim + Git
Plugin 'tpope/vim-surround' " edit what's surrounding a snippet of code
Plugin 'tpope/vim-abolish' " find/replace on steroids
Plugin 'Valloric/YouCompleteMe' " autocomplete (needs to install and configure cmake)
Plugin 'tomtom/tcomment_vim' " comment code
Plugin 'tpope/vim-endwise' " close 'if', 'def' etc

" end Vundle
call vundle#end()
filetype plugin indent on

""
" key mapping & stuff
""

" enable vim-airline
let g:airline#extensions#tabline#enabled = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" bufexplorer
nnoremap <F6> :BufExplorerHorizontalSplit<CR>

" tComment
map <C-c> :TComment<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

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
nnoremap <c-s> :w<cr>

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

" tabs - moving around, (CTRL+t to new tab)
map <C-t> :tabnew<CR>
map <C-M-n> :tabedit %<CR>
" map <C-l> :tabnext<cr>
" map <C-h> :tabprevious<cr>

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

