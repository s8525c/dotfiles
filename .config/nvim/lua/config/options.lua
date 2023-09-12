-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local global = vim.g
local options = vim.opt
local command = vim.cmd

-- global.mapleader = " "
-- global.maplocalleader = " "

-- options.guifont = "FiraCode NF:h14"
options.clipboard = "unnamedplus"

options.conceallevel = 0

options.updatetime = 100
options.scrolloff = 9999

options.tabstop = 2
options.colorcolumn = "80,120"
options.shiftwidth = 2
options.expandtab = true
options.signcolumn = "yes"

options.number = true
options.relativenumber = false

-- options.listchars = "eol:↴,tab:>·,trail:~,extends:>,precedes:<,space:·"
-- set listchars=tab:→\ ,trail:·,nbsp:·
options.listchars = "eol:↴,tab:>→,trail:·,nbsp:·"
options.list = true

options.background = "dark"
options.termguicolors = true

options.completeopt = "menuone,noselect"

options.swapfile = false
options.autoread = true

command("match errorMsg /\\s\\+$/")
command("set wrap linebreak")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local line_toggle = augroup("line_toggle", { clear = true })
autocmd("InsertLeave", {
  callback = function()
    vim.wo.relativenumber = true
  end,
  group = line_toggle,
})
autocmd("InsertEnter", {
  callback = function()
    vim.wo.relativenumber = false
  end,
  group = line_toggle,
})
