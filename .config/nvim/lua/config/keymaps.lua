-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local k = vim.keymap

k.set(
  "n",
  "<leader><CR>",
  ":nohlsearch<CR>",
  { noremap = true, silent = true, desc = "Turn off highlight search results" }
)
k.set("n", "<leader>to", ":tabnew ", { desc = "Open a new file in a new tab" })
k.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close the current tab" })
k.set("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true, desc = "Switch to the next tab" })
k.set("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Switch to the previous tab" })
k.set(
  "n",
  "<leader>ta",
  ":tab all<CR>",
  { noremap = true, silent = true, desc = "Open multiple files into tabs at once" }
)
k.set("n", "<leader>V", ":source %<CR>", { noremap = true, silent = true, desc = "Reload the config" })

k.set(
  "n",
  "<F5>",
  [[:%s/\s\+$//e<cr>]],
  { noremap = true, silent = true, desc = "Remove all trailing whitespace by pressing F5" }
)
