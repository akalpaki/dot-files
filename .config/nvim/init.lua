-- LOCALS

local opt = vim.opt
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local pack = vim.pack

-- OPTIONS

opt.swapfile = false
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.hlsearch = true
opt.cursorline = true
opt.smartcase = true
opt.scrolloff = 30
opt.signcolumn = 'yes'
opt.winborder = 'rounded'
opt.helpheight = 80
opt.clipboard = 'unnamedplus'
opt.guicursor = 'i:block' -- use block cursor in insert mode
opt.wrap = false
opt.completeopt = {'menuone', 'noselect', 'popup'}

vim.g.termguicolors = true 
vim.g.mapleader = " " -- must be set before plugins are loaded

-- PLUGINS

pack.add(
	{
		'https://github.com/bettervim/yugen.nvim',
		'https://github.com/nvim-lua/plenary.nvim',
		{
			src = 'https://github.com/ThePrimeagen/harpoon',
			version = 'harpoon2',
		},
		{
			src = 'https://github.com/nvim-treesitter/nvim-treesitter',
			version = 'master',
		},
		{
			src = 'https://github.com/nvim-telescope/telescope.nvim',
			version = '0.1.x',
		},
		'https://github.com/neovim/nvim-lspconfig',
		'https://github.com/mason-org/mason.nvim',
		'https://github.com/tpope/vim-vinegar',
	}
)

-- KEYBINDS AND SETUP

-- basic keybinds
map('n', '<leader>pv', ":Ex<CR>", opts)
map('n', '<C-u>', "zz<C-u>", opts)
map('n', '<C-d>', "zz<C-d>", opts)
map('n', '<leader>e', ':lua vim.diagnostic.open_float(0, { scope = "line" })<CR>', opts)

-- harpoon
local harpoon = require 'harpoon'
harpoon:setup()

map('n', '<leader>a', function() harpoon:list():add() end)
map('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map('n', '<C-h>', function() harpoon:list():select(1) end)
map('n', '<C-j>', function() harpoon:list():select(2) end)
map('n', '<C-k>', function() harpoon:list():select(3) end)
map('n', '<C-l>', function() harpoon:list():select(4) end)

-- treesitter
require 'nvim-treesitter.configs'.setup({
	ensure_installed = {'lua', 'go'},
	auto_install = 'false',
	hightlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd('PackChanged', {
	desc = 'Handle nvim-treesitter updates',
	group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true}),
	callback = function(event)
		if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
			vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
			local ok = pcall(vim.cmd, ':TSUpdate')
			if ok then
				vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
			else
				vim.notify('TSUpdate command not available yet, skipping...', vim.log.levels.WARN)
			end
		end
end,
})

-- telescope
-- TODO: set up fzf.
local builtin = require 'telescope.builtin'

map('n', '<leader>sf', builtin.find_files)
map('n', '<leader>sg', builtin.live_grep)
map('n', '<leader>sq', builtin.quickfix)
map('n', '<leader>sm', builtin.man_pages)
map('n', 'gd', builtin.lsp_definitions)
map('n', 'gr', builtin.lsp_references)
map('n', 'gI', builtin.lsp_implementations)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)

-- mason
require 'mason'.setup({})

-- theme
vim.cmd.colorscheme 'yugen'
