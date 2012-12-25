call pathogen#infect()
call pathogen#helptags()
set nocompatible
filetype plugin on
set t_Co=256
map <C-x><C-b> :BufExplorer<CR>

" Requirements for vim powerline. Don't bother repeating.
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_symbols='fancy'

syntax on
let moria_style = 'black'
colorscheme moria
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
"set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256 "very strange results on iterm2
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"  color solarized                 " load a colorscheme
"endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
nmap <C-x> :call AsyncMake  # asynchronous compilation

" http://www.vim.org/scripts/script.php?script_id=3834
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_older_paste

let g:ctrlp_lazy_update = 1
let g:NERDSpaceDelims = 1
so ~/.vimrc.local
au BufRead,BufNewFile *.go set nolist
au BufRead,BufNewFile *.go set ts=2 tw=2 noet

