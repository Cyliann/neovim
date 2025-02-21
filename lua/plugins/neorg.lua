---@type LazySpec
return {
    -- Neorg
    { "nvim-neorg/lua-utils.nvim", lazy = false },
    { "pysan3/pathlib.nvim", lazy = false },
    { "nvim-neotest/nvim-nio", lazy = false },
    {
      "nvim-neorg/neorg",
      lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
      version = "*", -- Pin Neorg to the latest stable release
      config = function()
        require("neorg").setup({
          load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "varied",
            }
          },
          ["core.export"] = {},
          ["core.summary"] = {
            config = {
              strategy = "by_path"
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/uni/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp"
            }
          },
          ["core.integrations.treesitter"] = {},
          ["core.integrations.nvim-cmp"] = {}
        }
        })
      end
    },
}
