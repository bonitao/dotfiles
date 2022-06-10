set nocompatible
filetype plugin on
set guifont=PragmataPro:h18
syntax on

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugin selection inspired by https://statico.github.io/vim3.html
call plug#begin('~/.vim/plugged')

" Check when startup becomes slow
Plug 'dstein64/vim-startuptime'

" The one theme that works for red only color blind people
Plug 'doums/darcula'
" colorscheme darcula
set termguicolors
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

Plug 'junegunn/goyo.vim'  " for writing books
Plug 'junegunn/limelight.vim'  " for writing books
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'jdhao/better-escape.vim'
Plug 'phaazon/hop.nvim'

Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'folke/which-key.nvim'

" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'sheerun/vim-polyglot'
Plug 'lukas-reineke/indent-blankline.nvim'
" Linters
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1

let g:session_autoload = 'no'
let g:session_autosave = 'no'
" Trying this out instead of vim-tabular
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'  " better ag/ack/grep
Plug 'sjl/gundo.vim'
Plug 'qpkorr/vim-bufkill'
" Bracketed paste commented because does not play well with tmux
Plug 'ToQoz/gentle_quitman.vim'  " do not quit vim all the time

"Beta
Plug 'psliwka/vim-smoothie'
call plug#end()

" Set dracula theme for lualine
lua require('lualine').setup { options = { theme = 'dracula' } }

" http://robots.thoughtbot.com/faster-grepping-in-vim
" bind leader * to grep word under cursor
nmap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
