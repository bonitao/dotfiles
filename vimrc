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

let g:ctrlp_lazy_update = 0

so ~/.vimrc.local
