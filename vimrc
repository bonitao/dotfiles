set nocompatible
filetype plugin on
set guifont=PragmataPro:h18
syntax on

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
map <C-x><C-b> :BufExplorer<CR>
" http://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
set clipboard=exclude:.*

" Color schemes and related plugins
Plugin 'xolox/vim-misc'  " dependency for colorscheme-switcher
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'godlygeek/csapprox'
" base16 never worked for me
" Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'itchyny/landscape.vim'
Plugin 'moria'
" Molokai fixes side effects
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'twerth/ir_black'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'

" Good theme if not switching automagically
let g:airline_theme = 'light'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'Lokaltog/vim-easymotion'
" emulate vim-sneak
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:pymode_rope_completion = 0
let g:pymode_rope = 0
let g:pymode_folding = 0
" Plugin 'klen/python-mode.git'
Plugin 'fisadev/vim-isort'
Plugin 'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" No real need for syntastic currently
" Plugin 'scrooloose/syntastic.git'
Plugin 'pthrasher/conqueterm-vim'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
Plugin 'xolox/vim-session'
" Trying this out instead of vim-tabular
Plugin 'junegunn/vim-easy-align'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'  " better ack/grep
Plugin 'sjl/gundo.vim'
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards
Plugin 'svermeulen/vim-easyclip'
Plugin 'kien/ctrlp.vim'
Plugin 'a.vim'
Plugin 'bufkill.vim'
" Bracketed paste commented because does not play well with tmux
" Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'tyru/vim-altercmd'  " allow remapping q
Plugin 'ToQoz/gentle_quitman.vim'  " do not quit vim all the time

"Beta
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
Plugin 'Shougo/unite.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
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
autocmd FileType go setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2 list lcs=tab:\ \ 

" No prompts.
" http://od-eon.com/blogs/stefan/reloading-externally-modified-buffers-vim/
set autoread
" http://items.sjbach.com/319/configuring-vim-right
set shortmess+=aAtI "Suppress the message when editing a file with a SWAP file
set visualbell
set ruler
