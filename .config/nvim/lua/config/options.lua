-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = vim.opt
local commands = vim.cmd
-- local map = vim.keymap.set

options.colorcolumn = "80,120"

options.listchars = "tab:>·,trail:·,extends:>,precedes:<,space:·"
options.list = true

-- https://old.reddit.com/r/neovim/comments/13cf8de/is_there_a_way_to_disable_saving_text_to_the/
-- options.clipboard = ""
-- map({ "n", "x" }, "Y", '"+y')
-- map("n", "p", '""p')

options.conceallevel = 0

-- options.updatetime = 100
-- options.scrolloff = 9999

options.tabstop = 2
options.shiftwidth = 2
options.softtabstop = 2
options.expandtab = true
options.signcolumn = "yes"

options.number = true
options.relativenumber = false

options.background = "dark"
options.termguicolors = true

options.completeopt = "menuone,noselect"

options.swapfile = false
options.autoread = true

-- Highlight trailing whitespace
commands("highlight TrailingWhitespace ctermbg=red guibg=red")
commands("match TrailingWhitespace /\\s\\+$/")
