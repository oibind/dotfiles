return {
  "lukas-reineke/indent-blankline.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
}
