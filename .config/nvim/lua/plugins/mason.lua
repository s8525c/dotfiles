return {
  "williamboman/mason.nvim",
  -- keys = {
  --   { "<leader>cm", false },
  -- },
  opts = {
    ensure_installed = {
      "bash-language-server",
      "dockerfile-language-server",
      "hadolint",
      "helm-ls",
      "json-lsp",
      "jsonlint",
      "jsonnet-language-server",
      "lua-language-server",
      "marksman",
      "prettierd",
      "shellcheck",
      "shfmt",
      "sqlls",
      "stylua",
      "terraform-ls",
      "tflint",
      "yaml-language-server",
      "yamlfmt",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    -- see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
    opts = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics

      return {
        sources = {

          -- formatting.prettierd.with({extra_args = {"--no-semi", "--single-qoute", "--jsx-single-qoute"}}),
          formatting.prettierd,

          -- lua
          formatting.stylua,
          diagnostics.luacheck.with({
            condition = function(utils)
              return utils.root_has_file(".luacheckrc")
            end,
          }),

          -- yaml
          formatting.yamlfmt,

          -- shell
          formatting.shfmt.with({ extra_args = { "-i", "4", "-ci" } }),
          diagnostics.shellcheck.with({ diagnostics_format = "[shellcheck] #{m} [#{c}]" }),

          -- json
          diagnostics.jsonlint,

          -- markdown
          diagnostics.markdownlint,
        },
      }
    end,
  },
}
