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
Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'itchyny/landscape.vim'
Plugin 'moria'
" Molokai fixes side effects
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'twerth/ir_black'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'

"let g:airline_left_sep = '⮀'
"let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠ '
let g:airline_readonly_symbol = '⭤'
let g:airline_paste_symbol = 'ρ'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_whitespace_symbol = 'Ξ'
" Good theme if not switching automagically
" let g:airline_theme = 'light'
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
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:pymode_rope_completion = 0
let g:pymode_folding = 0
Plugin 'klen/python-mode.git'
" No real need for syntastic currently
" Plugin 'scrooloose/syntastic.git'
Plugin 'pthrasher/conqueterm-vim'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
Plugin 'xolox/vim-session'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'  " better ack/grep
Plugin 'sjl/gundo.vim'
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-F> <plug>EasyClipSwapPasteForward
nmap <c-D> <plug>EasyClipSwapPasteBackwards
Plugin 'svermeulen/vim-easyclip'
Plugin 'kien/ctrlp.vim'
Plugin 'a.vim'
Plugin 'bufkill.vim'
" Bracketed paste commented because does not play well with tmux
" Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'tyru/vim-altercmd'  " allow remapping q
Plugin 'ToQoz/gentle_quitman.vim'  " do not quit vim all the time
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
" " Needed for chrome secure shell only
 " let g:solarized_termcolors=256
 " let g:solarized_termtrans=1
 " let g:solarized_termcolors=256 "very strange results on iterm2
 " let g:solarized_contrast="high"
 " let g:solarized_visibility="high"
 " if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  " colorscheme solarized                 " load a colorscheme
" endif

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

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
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
