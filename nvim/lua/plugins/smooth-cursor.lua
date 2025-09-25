return {
  "gen740/SmoothCursor.nvim",
  event = "BufReadPost",
  config = function()
    require("smoothcursor").setup({
      cursor = " ",
      fancy = {
        enable = true,
        head = { cursor = "" },
      },
    })
  end,
}
