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

-- avoid annoying jump from gitsigns
vim.opt.signcolumn='yes:1'
-- swap files are  super annoying and useless
vim.opt.swapfile = false

-- http://superuser.com/questions/40378/how-to-make-vims-auto-complete-behave-like-bashs-default-auto-complete
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'

-- Plugin installation and setup
require('lazy').setup({
	-- Startup time measurement
	{ 'dstein64/vim-startuptime' },
	{ "folke/trouble.nvim", config=true },

	-- Themes and UI
	-- { "xiantang/darcula-dark.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	-- { "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

	{ "binhtran432k/dracula.nvim" },
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = true },

	-- Writing aids
	{ 'junegunn/goyo.vim' },
	{ 'junegunn/limelight.vim' },

	--  -- Essential plugins
	{ 'numToStr/Comment.nvim', config = true },
	-- { 'kylechui/nvim-surround' }, // conflicts with leap.nvim
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

	-- Syntax and highlights
	{ 'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "bibtex", "c", "cue", "cpp", "diff", "dockerfile", "earthfile", "go", "gomod", "gosum", "gowork", "html", "java", "jq", "json", "just", "kotlin", "lua", "make", "markdown", "proto", "python", "rust", "sql", "starlark", "toml", "tsv", "xml" },
				-- latex requires node, hence not installed by default
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{ 'mcauley-penney/visual-whitespace.nvim', config = true },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'HiPhish/rainbow-delimiters.nvim' },

	-- autocompletion
	{'folke/tokyonight.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	-- linters
	{ 'w0rp/ale', config = function() vim.g.ale_completion_enabled = 1 end },

	-- Additional plugins
	{ 'junegunn/vim-easy-align' },
	{ 'sjl/gundo.vim' },
	{ 'qpkorr/vim-bufkill' },
	{ 'ToQoz/gentle_quitman.vim' },
	{ 'psliwka/vim-smoothie' }
})

vim.filetype.add({
	filename = {
		["Earthfile"] = "earthfile",
	},
})

vim.cmd.colorscheme("nightfly")
-- vim.cmd.colorscheme("darcula-solid")
-- https://github.com/ibhagwan/fzf-lua/blob/main/scripts/init.lua
vim.keymap.set("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.keymap.set("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.keymap.set("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.keymap.set("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
vim.keymap.set("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.keymap.set("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

-- if you want to know more about lsp-zero and mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
	ensure_installed = { "lua_ls" },
	-- enable more languages if you have npm and golang locally available
	-- ensure_installed = { "lua_ls", "rust_analyzer", "kotlin_language_server", "clangd", "dagger", "dockerls", "docker_compose_language_service", "earthlyls", "gopls", "gradle_ls", "html", "jsonls", "ruff", "sqls", "tsserver", "volar"  },
})

-- https://lsp-zero.netlify.app/v3.x/tutorial.html
require('lspconfig').lua_ls.setup({
	settings = {
		-- https://github.com/neovim/neovim/discussions/24119
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- https://github.com/folke/lazy.nvim/discussions/1349#discussioncomment-9122673
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				}
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			}

		}
	},
	on_init = function(client)
		local uv = vim.uv or vim.loop

		-- Apply neovim specific settings
		local lua_opts = lsp_zero.nvim_lua_ls()

		client.config.settings.Lua = vim.tbl_deep_extend(
			'force',
			client.config.settings.Lua,
			lua_opts.settings.Lua
		)
	end,
})
