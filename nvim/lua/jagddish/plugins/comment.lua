return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    opleader = {
      -- line-comment keymap
      line = "gc",
      -- block-comment keymap
      block = "gb",
    },

    mappings = {
      basic = true,
      -- extra mapping
      -- Includes `gco`, `gcO`, `gcA`
      extra = true,
    },
    toggler = {
      -- line-comment keymap
      line = "gcc",
      -- block-comment keymap
      block = "gbc",
    },
    pre_hook = nil,
    post_hook = nil,
    ignore = nil,
  },
}