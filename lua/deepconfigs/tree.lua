
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
local opts = {noremap= true, silent=true}
local keymap=vim.api.nvim_set_keymap
-- empty setup using defaults
require("nvim-tree").setup()
--Key Binding for nvim tree
-- nmap <silent> <C-b> :NvimTreeToggle<CR>
keymap("n","<leader>b",":NvimTreeToggle<CR>",opts)
