return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.lsp.enable({'lua_ls', 'gopls', 'tinymist'})
	end
}
