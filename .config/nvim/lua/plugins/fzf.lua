return {
	'ibhagwan/fzf-lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local fzf = require 'fzf-lua'
		vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')
		vim.keymap.set('n', '<leader>ca', ':FzfLua quickfix<CR>')
		vim.keymap.set('n', '<leader><leader>', ':FzfLua live_grep_native<CR>')
	end 
}
