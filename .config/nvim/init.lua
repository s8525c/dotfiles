-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Remap dd to _dd to avoid cutting when deleting
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
