-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  "AstroNvim/astrotheme",
  "simrat39/rust-tools.nvim",
  "andweeb/presence.nvim",
  "jbyuki/instant.nvim",
  { "adishourya/base46", lazy = false },
  { "lambdalisue/suda.vim", lazy = false },
  { "rose-pine/neovim", lazy = false },
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
    setup = { max_lines = 10 }
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
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })
    end,
  },
  -- Neorg
  { "nvim-neorg/lua-utils.nvim", lazy = false },
  { "pysan3/pathlib.nvim", lazy = false },
  { "nvim-neotest/nvim-nio", lazy = false },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
}
