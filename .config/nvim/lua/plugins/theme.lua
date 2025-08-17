return {
	'ring0-rootkit/ring0-dark.nvim',
	lazy = false,
	priority = 1000,
	config = function() 
		vim.cmd.colorscheme 'ring0dark'
	end
}
