return {
  "Wansmer/treesj",
  event = {"BufReadPre"},
  -- keys = { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  -- cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  -- opts = { use_default_keymaps = false },
  config = function()
    require("treesj").setup({--[[ your config ]]
      use_default_keymaps = false,
      vim.keymap.set("n", "<leader>m", require("treesj").toggle, { desc = "Toggle Treesj" }),
    })
  end,
}
