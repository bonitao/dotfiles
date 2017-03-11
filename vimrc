set nocompatible
filetype plugin on
set guifont=PragmataPro:h18
syntax on

set rtp+=~/.vim/bundle/Vundle.vim/
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
map <C-x><C-b> :BufExplorer<CR>
" http://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
set clipboard=exclude:.*

" Color schemes and related plugins
Plug 'xolox/vim-misc'  " dependency for colorscheme-switcher
Plug 'xolox/vim-colorscheme-switcher'
Plug 'godlygeek/csapprox'
" base16 never worked for me
" Plugin 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/landscape.vim'
Plug 'moria'
" Molokai fixes side effects
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'twerth/ir_black'
Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'

" Good theme if not switching automagically
" let g:airline_theme = 'light'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'Lokaltog/vim-easymotion'
" emulate vim-sneak
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:pymode_rope_completion = 0
let g:pymode_rope = 0
let g:pymode_folding = 0
" Plugin 'klen/python-mode.git'
Plug 'fisadev/vim-isort'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'

" No real need for syntastic currently
" Plugin 'scrooloose/syntastic.git'
Plug 'pthrasher/conqueterm-vim'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
Plug 'xolox/vim-session'
" Trying this out instead of vim-tabular
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'  " better ack/grep
Plug 'sjl/gundo.vim'
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards
Plug 'svermeulen/vim-easyclip'
Plug 'kien/ctrlp.vim'
Plug 'a.vim'
Plug 'bufkill.vim'
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
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
Plug 'Shougo/unite.vim'
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

" transparency
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark
colorscheme ir_black
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow
call gitgutter#highlight#define_highlights()

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
so ~/.vimrc.local
au BufRead,BufNewFile *.go set filetype=go
" No tabs
set shiftwidth=2 expandtab smarttab tabstop=4 softtabstop=4 list lcs=tab:\ \ 
" For a manual tab insertion, go into paste mode
set pastetoggle=<F3>
autocmd FileType go setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2 list lcs=tab:\ \ 

" No prompts.
" http://od-eon.com/blogs/stefan/reloading-externally-modified-buffers-vim/
set autoread
" http://items.sjbach.com/319/configuring-vim-right
set shortmess+=aAtI "Suppress the message when editing a file with a SWAP file
set visualbell
set ruler
