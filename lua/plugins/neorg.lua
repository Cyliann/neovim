if true then return {} end -- INFO: Broken for now. I'm not using Neorg recently and I don't have time to fix this

---@type LazySpec
return {
  "nvim-neorg/neorg",
  version = "^9",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
          }
        }, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Enables support for completion plugins
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/uni/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.export"] = {},
        ["core.summary"] = {
          config = {
            strategy = "by_path"
          }
        },
        ["core.integrations.treesitter"] = {},
        ["core.integrations.nvim-cmp"] = {}
      },
    })
  end,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "norg" })
        end
      end,
    },
  }
}
