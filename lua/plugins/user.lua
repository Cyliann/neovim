---@type LazySpec
return {
  "AstroNvim/astrotheme",
  "simrat39/rust-tools.nvim",
  "andweeb/presence.nvim",
  "jbyuki/instant.nvim",
  "subnut/nvim-ghost.nvim",
  { "adishourya/base46", lazy = false },
  { "lambdalisue/suda.vim", lazy = false },
  { "rose-pine/neovim", lazy = false },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { "chomosuke/typst-preview.nvim", opts = { invert_colors = "never" } },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
      persist_mode = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    setup = { max_lines = 10 },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts) require("gopher").setup(opts) end,
    build = function() vim.cmd [[silent! GoInstallDeps]] end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      rainbow = {
        enable = true,
        highlight_middle = true,
        max_file_lines = nil,
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
}
