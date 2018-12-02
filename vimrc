set nocompatible
filetype plugin on
set guifont=PragmataPro:h18
syntax on

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugin selection inspired by https://statico.github.io/vim3.html
call plug#begin('~/.vim/plugged')


" The one theme that works for red only color blind people
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/goyo.vim'  " for writing books
" let g:airline_theme = 'light'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'Lokaltog/vim-easymotion'
" emulate vim-sneak
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

" Syntax highlight
Plug 'sheerun/vim-polyglot'
" Linters
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1

" No real need for syntastic currently
" Plugin 'scrooloose/syntastic.git'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
" Trying this out instead of vim-tabular
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'  " better ag/ack/grep
Plug 'sjl/gundo.vim'
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards
Plug 'svermeulen/vim-easyclip'
Plug 'kien/ctrlp.vim'
Plug 'qpkorr/vim-bufkill'
" Bracketed paste commented because does not play well with tmux
" Plugin 'ConradIrwin/vim-bracketed-paste'
Plug 'tyru/vim-altercmd'  " allow remapping q
Plug 'ToQoz/gentle_quitman.vim'  " do not quit vim all the time

"Beta
Plug 'nathanaelkane/vim-indent-guides'  " use \ig to toggle
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>
Plug 'airblade/vim-gitgutter'
call plug#end()

" http://robots.thoughtbot.com/faster-grepping-in-vim
" bind leader * to grep word under cursor
nmap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Override q and friends
call altercmd#load()
AlterCommand q GQ
AlterCommand GQ q
AlterCommand quit GQ
AlterCommand GQ quit
AlterCommand wq GWQ
AlterCommand GWQ wq

" Requirements for vim powerline. Don't bother repeating.
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" http://superuser.com/questions/40378/how-to-make-vims-auto-complete-behave-like-bashs-default-auto-complete
set wildmenu
set wildmode=list:longest

"" The good parts from
"" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
set history=1000 " Store a ton of history (default is 20)
set hidden       " allow buffer switching without saving"

" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
nmap <C-x> :call AsyncMake  # asynchronous compilation

let g:ctrlp_lazy_update = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 50000
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:NERDSpaceDelims = 1

if filereadable("~/.vimrc.local")
  so ~/.vimrc.local
endif

" No prompts.
" http://od-eon.com/blogs/stefan/reloading-externally-modified-buffers-vim/
set autoread
" http://items.sjbach.com/319/configuring-vim-right
set shortmess+=aAtI "Suppress the message when editing a file with a SWAP file
set visualbell
set ruler
