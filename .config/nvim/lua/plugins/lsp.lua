return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.lsp.enable({'lua_ls', 'gopls', 'tinymist'})

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('lsp-attach-setup', {clear = true}),
			callback = function(event)
				local map = vim.keymap.set
				local opts = { buffer = event.buf }

				map('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
				map('n', 'gI', require('telescope.builtin').lsp_implementations, opts)
				map('n', 'gr', require('telescope.builtin').lsp_references, opts)
				map('n', '<leader>r', vim.lsp.buf.rename, opts)
				map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
			end,
		})
	end
}
