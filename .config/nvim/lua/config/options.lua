-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- local global = vim.g
-- global.mapleader = " "
-- global.maplocalleader = " "

local options = vim.opt

options.colorcolumn = "80,120"

-- options.listchars = "eol:↴,tab:>·,trail:~,extends:>,precedes:<,space:·"
-- set listchars=tab:→\ ,trail:·,nbsp:·
options.listchars = "tab:>→,trail:·,nbsp:·"
options.list = true

-- options.guifont = "FiraCode NF:h14"
options.clipboard = "unnamedplus"

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
