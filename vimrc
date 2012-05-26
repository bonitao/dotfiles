set nocompatible
set t_Co=256
syntax on
let moria_style = 'black' 
colorscheme moria
map <C-x><C-b> :BufExplorer<CR>

" The good parts from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nocompatible
