return {
  -- disable flash, the thing "enhances" search by putting letters at the end of each match to let you jump to them
  { "folke/flash.nvim", enabled = false },
  -- we have our own, very small, snippet collection
  { "rafamadriz/friendly-snippets", enabled = false },
  -- we don't want animations
  { "echasnovski/mini.animate", enabled = false },
  -- { "echasnovski/mini.pairs, enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  -- { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- get the full list of plugins to potentially disable using <leader>rp
}
