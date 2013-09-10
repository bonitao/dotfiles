call pathogen#infect()
call pathogen#helptags()
set nocompatible
filetype plugin on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
map <C-x><C-b> :BufExplorer<CR>

Bundle 'flazz/vim-colorschemes'
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
Bundle 'bling/vim-airline'

syntax on
" Needed for chrome secure shell only
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256 "very strange results on iterm2
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"  color solarized                 " load a colorscheme
" endif

Bundle 'gmarik/vundle'
Bundle 'saghul/vim-colortoggle'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
" Bundle 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
Bundle 'scrooloose/syntastic'
Bundle 'pthrasher/conqueterm-vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
Bundle 'xolox/vim-session'
" Bundle 'vim-scripts/a.vim'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'kien/ctrlp.vim'
Bundle 'a.vim'
Bundle 'bufexplorer.zip'
Bundle 'bufkill'



" From https://github.com/saghul/vim-colortoggle
let g:default_background_type = "dark"
let g:dark_colorscheme = "darktango"
let g:light_colorscheme = "tango"
map <silent><F11> :ToggleBg<CR>

" Requirements for vim powerline. Don't bother repeating.
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

let g:neocomplcache_enable_at_startup = 1
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

" http://www.vim.org/scripts/script.php?script_id=3834
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_older_paste

let g:ctrlp_lazy_update = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 50000
let g:NERDSpaceDelims = 1
so ~/.vimrc.local
au BufRead,BufNewFile *.go set nolist
au BufRead,BufNewFile *.go set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au BufRead,BufNewFile *.go set filetype=go

" No prompts.
" http://od-eon.com/blogs/stefan/reloading-externally-modified-buffers-vim/
set autoread

