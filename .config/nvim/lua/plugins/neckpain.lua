return {
	{
	'shortcuts/no-neck-pain.nvim',
	version = "*",
	config = function()
		local np = require 'no-neck-pain'
		np.setup({ width = 100 })
		
		vim.keymap.set('n', '<leader>np', function() np.toggle() end)
	end
	},
}
