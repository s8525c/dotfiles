-- keymaps.lua
local k = vim.keymap

k.set("n", "\\<CR>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Turn off highlight search results" })

k.set("n", "\\ta", ":tab all<CR>", { noremap = true, silent = true, desc = "Open multiple files into tabs at once" })
k.set(
	"n",
	"<F5>",
	[[:%s/\s\+$//e<cr>]],
	{ noremap = true, silent = true, desc = "Remove all trailing whitespace by pressing F5" }
)

k.del("n", "<C-Left>")
k.del("n", "<C-Right>")

-- Remove frustrations
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
