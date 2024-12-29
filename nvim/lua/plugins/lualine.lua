return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require("lualine").setup({
      options = { theme = 'gruvbox' },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      }
    })
  end,
}
