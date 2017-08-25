" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" required
set nocompatible

syntax on

filetype off

let base16colorspace=16
set background=dark
set t_Co=16
set t_ut=
colorscheme base16-default-dark " set colorscheme
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

" ag.vim ignore log and tmp
if !exists("g:agprg")
    let g:agprg="ag --ignore ./log --ignore ./tmp --nogroup --column"
endif

:helptags ~/.vim/doc

" Emmet map
" let g:user_emmet_leader_key='<C-E>'
filetype plugin indent on

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
nnoremap <leader>gs :Gsearch

" remove unwanted spaces
nmap <leader>rs :%s/\s\+$//<cr>

" buffer - moving around
map <C-Left> :bprevious<CR>
map <C-Right> :bnext<CR>
map <C-Down> :bdelete!<CR>

" tabs - moving around, (CTRL+t to new tab)
map <C-S-Left> :tabprev<CR>
map <C-S-Right> :tabnext<CR>
map <C-Up> :tabnew<CR>

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

