require('core.keybinds')
require('core.settings')
require('core.lazy')

-- make statusline transparent
vim.cmd(':hi statusline guibg=NONE')

vim.cmd.colorscheme 'boring'
-- vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
