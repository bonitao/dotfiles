-- init.llua

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set font
vim.opt.guifont = "PragmataPro:h18"

-- http://stevelosh.com/blog/2010/09/coming-home-to-vim/
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 3

-- http://superuser.com/questions/40378/how-to-make-vims-auto-complete-behave-like-bashs-default-auto-complete
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'

-- Plugin installation and setup
require('lazy').setup({
  -- Startup time measurement
  { 'dstein64/vim-startuptime' },

  -- Themes and UI
  -- { "xiantang/darcula-dark.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	-- { "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "binhtran432k/dracula.nvim" },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = true },

  -- Writing aids
  { 'junegunn/goyo.vim' },
  { 'junegunn/limelight.vim' },

 --  -- Essential plugins
  { 'numToStr/Comment.nvim', config = true },
  { 'kylechui/nvim-surround' },
  { 'ggandor/leap.nvim', config = function()  require('leap').create_default_mappings() end },
  { 'ggandor/flit.nvim', config = true },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-dispatch' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-eunuch' },
  { 'max397574/better-escape.nvim', config = true },


  --- git
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'sindrets/diffview.nvim' },

  -- Other utilities
  { "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
  { 'nvimdev/hlsearch.nvim', event = 'BufRead', config=true },
  { 'folke/which-key.nvim' },

  -- Syntax and linting
  { 'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "bash", "bibtex", "c", "cue", "cpp", "diff", "dockerfile", "go", "gomod", "gosum", "gowork", "html", "java", "javascript", "jq", "json", "just", "kotlin", "latex", "lua", "make", "markdown", "proto", "python", "rust", "sql", "starlark", "swift", "toml", "tsv", "typescript", "vue", "xml" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'HiPhish/rainbow-delimiters.nvim' },
  { 'w0rp/ale', config = function() vim.g.ale_completion_enabled = 1 end },

  -- Additional plugins
  { 'junegunn/vim-easy-align' },
  { 'sjl/gundo.vim' },
  { 'qpkorr/vim-bufkill' },
  { 'ToQoz/gentle_quitman.vim' },
  { 'psliwka/vim-smoothie' }
})

vim.cmd.colorscheme("dracula-soft")
-- vim.cmd.colorscheme("darcula-solid")
-- https://github.com/ibhagwan/fzf-lua/blob/main/scripts/init.lua
vim.keymap.set("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.keymap.set("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.keymap.set("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.keymap.set("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
vim.keymap.set("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.keymap.set("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
