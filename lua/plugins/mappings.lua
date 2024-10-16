---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        -- go to  beginning and end
        ["<C-A>"] = { "<ESC>^i", desc = "beginning of line" },
        ["<C-E>"] = { "<End>", desc = "end of line" },

        -- navigate within insert mode
        ["<C-H>"] = { "<Left>", desc = "move left" },
        ["<C-L>"] = { "<Right>", desc = "move right" },
        ["<C-J>"] = { "<Down>", desc = "move down" },
        ["<C-K>"] = { "<Up>", desc = "move up" },

        ["<C-S-V>"] = { "<C-R>*", desc = "paste from clipboard" },
      },

      n = {
        -- Switch buffers
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["<expr> j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down" },
        ["<expr> k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up" },

        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },

        -- Use ";" as command mode
        [";"] = { ":" },

        ["<Leader>m"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },

        ["s"] = { ":%s/", desc = "Search and replace" },
        ["<Leader>E"] = { ":cd %:p:h<cr>", desc = "Change workdir to current open file" },

        -- Gopher
        ["<Leader>G"] = { name = "Gopher" },
        ["<Leader>Ge"] = { "<cmd>GoIfErr<cr>", desc = "Inline Go if err" },
        ["<Leader>Gj"] = { "<cmd>GoTagAdd<cr>", desc = "Add JSON tags for Go struct" },
        ["<Leader>Gt"] = { "<cmd>GoTestAdd<cr>", desc = "Generate test for current function" },
        ["<Leader>GT"] = { "<cmd>GoTestAll<cr>", desc = "Generate tests for all functions" },
      },

      v = {
        -- Use ";" as command mode
        [";"] = { ":" },

        ["s"] = { ":s/", desc = "Search and replace" },
      },

      x = {
        -- Dellete text when pasting instead of overwriting register
        ["p"] = { '"_dP' },
      },
    },
    }
}
