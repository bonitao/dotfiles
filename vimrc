call pathogen#infect()
set nocompatible
filetype plugin on
set t_Co=256
map <C-x><C-b> :BufExplorer<CR>

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

" from https://github.com/spf13/spf13-vim/blob/master/.vimrc
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
